package com.mall.order.vo;

import lombok.Data;

/**
 * @Description:
 * @Created: with IntelliJ IDEA.
 * @author: 夏沫止水
 * @createTime: 2020-07-02 19:03
 **/

@Data
public class MemberAddressVo {

    private Long id;
    /**
     * member_id
     */
    private Long memberId;
    private String name;
    private String phone;
    private String email;
    private String postCode;
    private String country;
    private String city;
    private String addressLine1;
    private String addressLine2;
    private Integer defaultStatus;

}
