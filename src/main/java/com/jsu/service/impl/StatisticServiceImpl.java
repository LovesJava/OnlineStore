package com.jsu.service.impl;

import com.google.common.collect.Maps;
import com.jsu.common.ServerResponse;
import com.jsu.dao.OrderMapper;
import com.jsu.dao.ProductMapper;
import com.jsu.dao.UserMapper;
import com.jsu.service.IStatisticService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("iStatisticService")
public class StatisticServiceImpl implements IStatisticService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public ServerResponse getCount() {
        Integer userCount = userMapper.getUserCount();
        Integer productCount = productMapper.getProductCount();
        Integer orderCount = orderMapper.getOrderCount();

        Map<String, Integer> result = Maps.newHashMap();
        result.put("userCount", userCount);
        result.put("productCount", productCount);
        result.put("orderCount", orderCount);

        return ServerResponse.createBySuccess(result);
    }
}
