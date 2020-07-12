package com.hua.dao;

import com.hua.domain.Goods;
import com.hua.domain.UserOrder;

import java.util.Map;

public interface IOrderDao {

    Integer saveOrder(Integer carId,Integer uid);

    UserOrder getUserOrder(Integer orderId);

    Map<Goods,Integer> getGoodsByOrderId(Integer orderId);
}
