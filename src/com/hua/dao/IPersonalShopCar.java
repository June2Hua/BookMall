package com.hua.dao;

import com.hua.domain.PersonalShopCar;

import java.util.Date;

public interface IPersonalShopCar {

    PersonalShopCar findPersonalShopCarByUserId(String id);

    PersonalShopCar savePersonalShopCar(String userId);
}
