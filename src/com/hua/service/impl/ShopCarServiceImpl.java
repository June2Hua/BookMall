package com.hua.service.impl;

import com.hua.dao.IGoodsAndCarDao;
import com.hua.dao.IPersonalShopCarDao;
import com.hua.dao.impl.GoodsAndCarDaoImpl;
import com.hua.dao.impl.PersonalShopCarDaoImpl;
import com.hua.domain.GoodsAndCar;
import com.hua.domain.PersonalShopCar;
import com.hua.service.IShopCarService;

public class ShopCarServiceImpl implements IShopCarService {

    IPersonalShopCarDao personalShopCar=new PersonalShopCarDaoImpl();

    IGoodsAndCarDao goodsAndCar=new GoodsAndCarDaoImpl();

    @Override
    public boolean addGoodsToShopCar(String userId, Integer goodsId) {
        //根据用户查询出用户对应的购物车
        PersonalShopCar personalShopCarByUserId = personalShopCar.findPersonalShopCarByUserId(userId);
        //如果购物车为空，则创建购物车
        if(personalShopCarByUserId==null){
            personalShopCarByUserId=personalShopCar.savePersonalShopCar(userId);
        }
        System.out.println(personalShopCarByUserId);
        //查询商品和购物车表
        GoodsAndCar goodsAndCarByGoodsIdAndCarId = goodsAndCar.getGoodsAndCarByGoodsIdAndCarId(goodsId, personalShopCarByUserId.getId());
        System.out.println(goodsAndCarByGoodsIdAndCarId);
        //如果不存在，则添加数据
        if(goodsAndCarByGoodsIdAndCarId==null){
            goodsAndCar.saveGoodsAndCar(goodsId, personalShopCarByUserId.getId());
        }else{//存在，则将对应的购物车商品+1
            goodsAndCar.updateGoodsAndCar(goodsId,personalShopCarByUserId.getId() , goodsAndCarByGoodsIdAndCarId.getCount()+1);
        }
        return true;
    }
}
