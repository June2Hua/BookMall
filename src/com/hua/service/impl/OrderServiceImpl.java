package com.hua.service.impl;

import com.hua.dao.IOrderDao;
import com.hua.dao.impl.OrderDaoImpl;
import com.hua.service.IOrderService;

/**
 * 订单service类
 */
public class OrderServiceImpl implements IOrderService {

    IOrderDao orderDao=new OrderDaoImpl();

    /**
     * 下单
     * @param carId
     */
    @Override
    public Integer placeAnOrder(Integer carId,Integer uid) {
        return orderDao.saveOrder(carId,uid);
    }
}
