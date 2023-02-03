/** Copyright 2020 bejson.com */
package com.xunqi.gulimall.product.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 */

@Data
public class SkusVoWeb {
  private BigDecimal price;
  private BigDecimal originalPrice;
  private String skuTitle;
  private String skuSubtitle;
  private String skuDesc;
}
