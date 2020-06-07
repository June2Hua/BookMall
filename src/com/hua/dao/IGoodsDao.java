package com.hua.dao;

import com.hua.domain.Goods;

import java.util.List;

public interface IGoodsDao {

    List<Goods> getLastestGoods();

    List<Goods> getAll();

    boolean saveGoods();

    Goods getGoodsById(Integer id);

}
