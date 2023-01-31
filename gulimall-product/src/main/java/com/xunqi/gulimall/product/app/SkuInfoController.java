package com.xunqi.gulimall.product.app;

import com.xunqi.common.utils.PageUtils;
import com.xunqi.common.utils.R;
import com.xunqi.gulimall.product.entity.SkuInfoEntity;
import com.xunqi.gulimall.product.service.SkuInfoService;
import com.xunqi.gulimall.product.service.SpuInfoService;
import com.xunqi.gulimall.product.vo.SkuItemVo;
import com.xunqi.gulimall.product.vo.Skus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;


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
     * TODO 回显 edit SPU stock Info
     */
    @GetMapping("/vo/sku/saleAttr/{spuId}")
    //@RequiresPermissions("product:spuinfo:update")
    public R displaySaleAttr(@PathVariable("spuId") Long spuId){
        //pms_sku_info   get spu_id
//        List<Long> ids = spuInfoService.
        List<Skus> skus = new ArrayList<>();
        return R.ok().put("skus",skus);
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
