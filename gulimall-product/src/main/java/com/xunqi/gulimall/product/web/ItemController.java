package com.xunqi.gulimall.product.web;

import com.common.utils.R;
import com.xunqi.gulimall.product.service.SkuInfoService;
import com.xunqi.gulimall.product.service.SpuInfoService;
import com.xunqi.gulimall.product.vo.*;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.*;

/**
 * @Description:
 * @Created: with IntelliJ IDEA.
 * @author: 夏沫止水
 * @createTime: 2020-06-19 11:21
 **/

@RestController
@RequestMapping("public/shop")
public class ItemController {

    @Resource
    private SkuInfoService skuInfoService;
    @Autowired
    private SpuInfoService spuInfoService;
    /**
     * 展示当前sku的详情
     * @param skuId
     * @return
     */
    @GetMapping("/{skuId}")
    @ResponseBody
    @SneakyThrows
    public R skuItem(@PathVariable("skuId") Long skuId) {

        SkuItemVo vos = skuInfoService.item(skuId);

        return R.ok().put("data",vos);
    }


    /**
     *
     * @return
     * TODO
     * list of SPU general product
     * brand info
     * list of sku
     *
     */
    @GetMapping("/list")
    @ResponseBody
    @SneakyThrows
    public ResponseEntity<?> productList(@RequestParam Map<String, Object> params) {
        return new ResponseEntity<>(spuInfoService.queryPageByCondtionVO(params), HttpStatus.CREATED);
    }

}