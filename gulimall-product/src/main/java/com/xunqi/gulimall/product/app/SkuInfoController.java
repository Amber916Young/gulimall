package com.xunqi.gulimall.product.app;

import com.common.es.SkuEsModel;
import com.common.utils.PageUtils;
import com.common.utils.R;
import com.xunqi.gulimall.product.entity.*;
import com.xunqi.gulimall.product.service.*;
import com.xunqi.gulimall.product.vo.SkuItemVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.*;
import java.util.concurrent.ExecutionException;
import java.util.stream.Collectors;


/**
 * sku信息
 *
 * @author 夏沫止水
 * @email HeJieLin@gulimall.com
 * @date 2020-05-22 19:00:18
 */
@RestController
@RequestMapping("product/skuinfo")
public class SkuInfoController {
    @Autowired
    private SkuInfoService skuInfoService;
    @Autowired
    private SpuInfoService spuInfoService;
    @Autowired
    private SkuImagesService skuImagesService;
    @Autowired
    private ProductAttrValueService productAttrValueService;
    @Autowired
    private AttrService attrService;
    @Autowired
    private BrandService brandService;
    @Autowired
    private CategoryService categoryService;
    /**
     * 根据skuId查询当前商品的价格
     * @param skuId
     * @return
     */
    @GetMapping(value = "/{skuId}/price")
    public BigDecimal getPrice(@PathVariable("skuId") Long skuId) {

        //获取当前商品的信息
        SkuInfoEntity skuInfo = skuInfoService.getById(skuId);

        //获取商品的价格
        BigDecimal price = skuInfo.getPrice();

        return price;
    }

    /**
     * TODO Back to the display edit SPU stock Info
     */
    @GetMapping("/vo/sku/saleAttr/{spuId}")
    //@RequiresPermissions("product:spuinfo:update")
    public R displaySaleAttr(@PathVariable("spuId") Long spuId){
        List<SkuInfoEntity> skuInfoEntities = skuInfoService.getSkusBySpuId(spuId);
        List<ProductAttrValueEntity> baseAttrs = productAttrValueService.baseAttrListforspu(spuId);
        List<Long> attrIds = baseAttrs.stream().map(attr -> {
            return attr.getAttrId();
        }).collect(Collectors.toList());

        List<Long> searchAttrIds = attrService.selectSearchAttrs(attrIds);
        Set<Long> idSet = searchAttrIds.stream().collect(Collectors.toSet());

        List<SkuEsModel.Attrs> attrsList = baseAttrs.stream().filter(item -> {
            return idSet.contains(item.getAttrId());
        }).map(item -> {
            SkuEsModel.Attrs attrs = new SkuEsModel.Attrs();
            BeanUtils.copyProperties(item, attrs);
            return attrs;
        }).collect(Collectors.toList());

        BrandEntity brandEntity = brandService.getById(skuInfoEntities.get(0).getBrandId());
        CategoryEntity categoryEntity = categoryService.getById(skuInfoEntities.get(0).getCatalogId());

        for(SkuInfoEntity skuInfo : skuInfoEntities){
            skuInfo.setBrandName(brandEntity.getName());
            skuInfo.setBrandId(brandEntity.getBrandId());
            skuInfo.setBrandImg(brandEntity.getLogo());
            skuInfo.setCatalogId(categoryEntity.getCatId());
            skuInfo.setCatalogName(categoryEntity.getName());
            skuInfo.setAttrs(attrsList);
            List<SkuImagesEntity> images = skuImagesService.getImagesBySkuId(skuInfo.getSkuId());
            skuInfo.setImagesList(images);
        }
        return R.ok().put("skus",skuInfoEntities);
    }


    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("product:skuinfo:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = skuInfoService.queryPageCondition(params);

        return R.ok().put("page", page);
    }


    /**
     * preview
     * new method
     */

    @GetMapping("/preview/{skuId}")
    public R skuItem(@PathVariable("skuId") Long skuId)
            throws ExecutionException, InterruptedException {
        System.out.println("准备查询" + skuId + "详情");

        SkuItemVo vos = skuInfoService.item(skuId);

        return R.ok().put("SkuItemVo", vos);


    }
    /**
     * 信息
     */
    @RequestMapping("/info/{skuId}")
    //@RequiresPermissions("product:skuinfo:info")
    public R info(@PathVariable("skuId") Long skuId){
		SkuInfoEntity skuInfo = skuInfoService.getById(skuId);

        return R.ok().put("skuInfo", skuInfo);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("product:skuinfo:save")
    public R save(@RequestBody SkuInfoEntity skuInfo){
		skuInfoService.save(skuInfo);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("product:skuinfo:update")
    public R update(@RequestBody SkuInfoEntity skuInfo){
		skuInfoService.updateById(skuInfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("product:skuinfo:delete")
    public R delete(@RequestBody Long[] skuIds){
		skuInfoService.removeByIds(Arrays.asList(skuIds));

        return R.ok();
    }

}
