/** Copyright 2020 bejson.com */
package com.xunqi.gulimall.product.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;


@Data
public class SpuSaveVo{
  private String spuName;
  private String spuDescription;
  private List<String> images;
  private int publishStatus;
  private Bounds bounds;
  private Long catalogId;
  private Long brandId;
  private BigDecimal weight;
  private List<BaseAttrs> baseAttrs;
  private List<Skus> skus;
}
