package com.mall.order.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 订单
 */
@Data
@TableName("oms_order")
public class OrderEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@TableId
	private Long id;
	private String orderSn;
	private Date createTime;
	private BigDecimal totalAmount;
	private BigDecimal payAmount;
	private BigDecimal shippingAmount ;
	private BigDecimal discountAmount ;
	/**
	 * 支付方式【1->bank；2->Cash on delivery；】
	 */
	private Integer paymentMethod;
	/**
	 * 订单来源[0->PC订单；1->app订单]
	 */
	private Integer sourceType;
	/**
	 * 订单状态【0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单】
	 */
	private Integer status;
	/**
	 * 物流公司(配送方式)
	 */
	private String deliveryCompany;
	/**
	 * 物流单号
	 */
	private String deliverySn;
	/**
	 * 自动确认时间（天）
	 */
	private Integer autoConfirmDay;
	/**
	 * 发票类型[0->不开发票；1->电子发票；2->纸质发票]
	 */
	private Integer invoiceType;
	private String invoiceAddressLine1;
	private String invoiceAddressLine2;
	private String invoiceAddressLine3;
	private String receiverName;
	private String receiverPhone;
	private String receiverEmail;
	private String receiverPostCode;
	private String receiverCounty;
	private String receiverCountry;
	private String addressLine1;
	private String addressLine2;
	private String addressLine3;
	private String note;
	/**
	 * 确认收货状态[0->未确认；1->已确认]
	 */
	private Integer confirmStatus;
	/**
	 * 删除状态【0->未删除；1->已删除】
	 */
	private Integer deleteStatus;
	/**
	 * 支付时间
	 */
	private Date paymentTime;
	/**
	 * 发货时间
	 */
	private Date deliveryTime;
	/**
	 * 确认收货时间
	 */
	private Date receiveTime;
	/**
	 * 评价时间
	 */
	private Date commentTime;
	/**
	 * 修改时间
	 */
	private Date modifyTime;

	@TableField(exist = false)
	private List<OrderItemEntity> orderItemEntityList;


	@TableField(exist = false)
	private PaymentInfoEntity paymentInfo;
}
