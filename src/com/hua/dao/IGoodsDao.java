package com.hua.dao;

import com.hua.domain.Goods;

import java.util.List;
import java.util.Map;

public interface IGoodsDao {

    List<Goods> getLastestGoods();

    List<Goods> getAll();

    boolean saveGoods();

    Goods getGoodsById(Integer id);

    Map<Goods,Integer> getGoodsByShopCarId(Integer id);

}
