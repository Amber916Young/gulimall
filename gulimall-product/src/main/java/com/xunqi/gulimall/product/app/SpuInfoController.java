package com.xunqi.gulimall.product.app;

import com.xunqi.common.utils.PageUtils;
import com.xunqi.common.utils.R;
import com.xunqi.gulimall.product.entity.SkuInfoEntity;
import com.xunqi.gulimall.product.entity.SpuInfoEntity;
import com.xunqi.gulimall.product.service.SpuInfoService;
import com.xunqi.gulimall.product.vo.SkuItemVo;
import com.xunqi.gulimall.product.vo.SpuSaveVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;



/**
 * spu信息
 */
@RestController
@RequestMapping("product/spuinfo")
public class SpuInfoController {
    @Autowired
    private SpuInfoService spuInfoService;

    /**
     * 根据skuId查询spu的信息
     * @param skuId
     * @return
     */
    @GetMapping(value = "/skuId/{skuId}")
    public R getSpuInfoBySkuId(@PathVariable("skuId") Long skuId) {

        SpuInfoEntity spuInfoEntity = spuInfoService.getSpuInfoBySkuId(skuId);

        return R.ok().setData(spuInfoEntity);
    }

    //商品上架
    ///product/spuinfo/{spuId}/up
    @PostMapping(value = "/{spuId}/up")
    public R spuUp(@PathVariable("spuId") Long spuId) {

        spuInfoService.up(spuId);

        return R.ok();
    }

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("product:spuinfo:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = spuInfoService.queryPageByCondtion(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("product:spuinfo:info")
    public R info(@PathVariable("id") Long id){
		SpuInfoEntity spuInfo = spuInfoService.getById(id);

        return R.ok().put("spuInfo", spuInfo);
    }

    /**
     * TODO 回显 edit SPU
     */
    @RequestMapping("/vo/display")
    //@RequiresPermissions("product:spuinfo:update")
    public R display(@RequestBody SpuSaveVo vo){
        return R.ok();
    }





    @RequestMapping("/save")
    public R save(@RequestBody SpuSaveVo spuSaveVo){
        spuInfoService.saveSpuSaveVo(spuSaveVo);
        return R.ok();
    }
    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("product:spuinfo:update")
    public R update(@RequestBody SpuInfoEntity spuInfo){
		spuInfoService.updateById(spuInfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("product:spuinfo:delete")
    public R delete(@RequestBody Long[] ids){
		spuInfoService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
