package com.hua.dao;

import com.hua.domain.GoodsAndCar;

/**
 * 商品和购物车，多对多
 */
public interface IGoodsAndCar {

    boolean saveGoodsAndCar(Integer goodsId,Integer carId);

    GoodsAndCar getGoodsAndCarByGoodsIdAndCarId(Integer goodsId,Integer carId);

    boolean updateGoodsAndCar(Integer goodsId,Integer carId,Integer count);

}
