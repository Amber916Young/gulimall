package mall.cart.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class CartVo {

    /**
     * 购物车子项信息
     */
    List<CartItemVo> items;

    /**
     * 商品数量
     */
    private Integer countNum;

    /**
     * 商品类型数量
     */
    private Integer countType;

    /**
     * 商品总价
     */
    private BigDecimal totalAmount;

    /**
     * 减免价格
     */
    private BigDecimal reduce = new BigDecimal("0.00");


    public Integer getCountNum() {
        int count=0;
        if (items != null && items.size() > 0) {
            for (CartItemVo item : items) {
                count += item.getCount();
            }
        }
        return count;
    }


    public Integer getCountType() {
        int count=0;
        if (items != null && items.size() > 0) {
            for (CartItemVo item : items) {
                count += 1;
            }
        }
        return count;
    }


    public BigDecimal getTotalAmount() {
        BigDecimal total = new BigDecimal(0);
        if (items != null && items.size() > 0) {
            for (CartItemVo item : items) {
                total.add(item.getTotalPrice());
            }
        }
        total.subtract(reduce);
        return total;
    }
}
