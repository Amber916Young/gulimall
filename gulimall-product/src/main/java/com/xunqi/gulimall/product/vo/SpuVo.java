/** Copyright 2020 bejson.com */
package com.xunqi.gulimall.product.vo;

import lombok.Data;

import java.util.List;

@Data
public class SpuVo {
  private String spuName;
  private Long id;
  private String spuDescription;
  private String defaultImage;
  private List<SkuItemVoWeb> skuItemVoList;
  private List<SpuItemAttrGroupVo> groupAttrs;
  private List<SkuItemSaleAttrVo> attrs;

}
