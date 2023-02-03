package com.xunqi.gulimall.product.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.List;

import com.common.es.SkuEsModel;
import lombok.Data;

/**
 * sku信息
 */
@Data
@TableName("pms_sku_info")
public class SkuInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	@TableId
	private Long skuId;
	private Long spuId;
	private String skuDesc;
	private Long catalogId;
	@TableField(exist = false)
	private String catalogName;
	private Long brandId;
	@TableField(exist = false)
	private String brandName;
	@TableField(exist = false)
	private String brandImg;
	private String skuDefaultImg;
	private String skuTitle;
	private String skuSubtitle;
	private BigDecimal price;
	private BigDecimal originalPrice;
	private Long saleCount;
	@TableField(exist = false)
	private Boolean hasStock = true;
	@TableField(exist = false)
	private List<SkuEsModel.Attrs> attrs;
	@TableField(exist = false)
	private List<SkuImagesEntity> imagesList;



}
