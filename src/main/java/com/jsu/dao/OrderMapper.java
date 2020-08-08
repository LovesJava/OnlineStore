package com.jsu.dao;

import com.jsu.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    Order selectByUserIdAndOrderNo(@Param("userId") Integer userId, @Param("orderNo") Long orderNo);

    Order selectByOderNo(Long orderNo);

    List<Order> selectByUserId(Integer userId);

    List<Order> selectAllOrder();

    int getOrderCount();

    //获取需要关闭的订单列表
    List<Order> selectOrderStatusByCreateTime(@Param("status") Integer status, @Param("date") String date);

    //关闭订单（改变订单的支付状态）
    int closeOrderByOrderId(Integer id);
}