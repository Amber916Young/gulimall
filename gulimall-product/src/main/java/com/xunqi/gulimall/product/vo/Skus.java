/** Copyright 2020 bejson.com */
package com.xunqi.gulimall.product.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * Auto-generated: 2020-05-31 11:3:26
 * @website http://www.bejson.com/java2pojo/
 */

@Data
public class Skus  extends  SkusVoWeb{

  private List<Attr> attr;
  private BigDecimal price;
  private BigDecimal originalPrice;
  private String skuTitle;
  private String skuSubtitle;
  private String skuDesc;
  private List<Images> images;
  private int fullCount;
  private BigDecimal discount;
  private int countStatus;
  private BigDecimal fullPrice;
  private BigDecimal reducePrice;
  private int priceStatus;
  private List<MemberPrice> memberPrice;

}
