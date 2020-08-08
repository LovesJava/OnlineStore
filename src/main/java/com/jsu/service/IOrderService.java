package com.jsu.service;

import com.github.pagehelper.PageInfo;
import com.jsu.common.ServerResponse;
import com.jsu.vo.OrderVo;

import java.util.Map;

public interface IOrderService {

    ServerResponse createOrder(Integer userId, Integer shippingId);

    ServerResponse<String> cancel(Integer userId, Long orderNo);

    ServerResponse getOrderCartProduct(Integer userId);

    ServerResponse<OrderVo> getOrderDetail(Integer userId, Long orderNo);

    ServerResponse<PageInfo> getOrderList(Integer userId, int pageNum, int pageSize);


    ServerResponse pay(Long orderNo, Integer userId, String path);

    ServerResponse alipayCallback(Map<String, String> params);

    ServerResponse queryOrderPayStatus(Integer userId, Long orderNo);


    //后台接口
    ServerResponse<PageInfo> manageList(int pageNum, int pageSize);

    ServerResponse<OrderVo> manageDetail(Long orderNo);

    ServerResponse<PageInfo> manageSearch(Long orderNo, int pageNum, int pageSize);

    ServerResponse<String> manageSendGoods(Long orderNo);

    //定时关单接口（对hour个小时内未付款的订单，进行关闭）
    void closeOrder(int hour);
}
