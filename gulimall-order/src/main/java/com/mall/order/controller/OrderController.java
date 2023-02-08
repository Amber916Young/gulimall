package com.mall.order.controller;

import com.common.utils.PageUtils;
import com.common.utils.R;
import com.mall.order.entity.OrderEntity;
import com.mall.order.service.OrderItemService;
import com.mall.order.service.OrderService;
import com.mall.order.service.PaymentInfoService;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;



/**
 * 订单
 */
@RestController
@RequestMapping("order/order")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderItemService orderItemService;
    /**
     * 根据订单编号查询订单状态
     * @param orderSn
     * @return
     */
    @GetMapping(value = "/status/{orderSn}")
    public R getOrderStatus(@PathVariable("orderSn") String orderSn) {
        OrderEntity orderEntity = orderService.getOrderByOrderSn(orderSn);
        return R.ok().setData(orderEntity);
    }

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("order:order:list")
    public R list(Map<String, Object> params){

        PageUtils page = orderService.queryPage(params);

        return R.ok().put("page", page);
    }

    /**
     * 分页查询当前登录用户的所有订单信息
     * @param params
     * @return
     */
    @PostMapping("/listWithItem")
    //@RequiresPermissions("order:order:list")
    public R listWithItem(@RequestBody Map<String, Object> params){
        PageUtils page = orderService.queryPageWithItem(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("order:order:info")
    public R info(@PathVariable("id") Long id){
        OrderEntity order = orderService.getDetailById(id);
        return R.ok().put("order", order);
    }

    /**
     * 保存
     */
    @RequestMapping("/create")
    @SneakyThrows
    //@RequiresPermissions("order:order:save")
    public R save(@RequestBody OrderEntity order){
         order = orderService.create(order);
        return R.ok().put("order",order);
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("order:order:update")
    public R update(@RequestBody OrderEntity order){
		orderService.updateById(order);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("order:order:delete")
    public R delete(@RequestBody Long[] ids){
		orderService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
