package com.mall.order.enume;

/**
 * Enumeration of order status
 */

public enum OrderStatusEnum {
    CREATE_NEW(0,"Unpaid"),
    PAYED(1,"Paid"),
    SENDED(2,"Shipped"),
    RECIEVED(3,"Completed"),
    CANCLED(4,"Cancelled"),
    SERVICING(5,"After-Sales"),
    SERVICED(6,"After-sales completion");
    private Integer code;
    private String msg;

    OrderStatusEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
