package com.hua.domain;

import java.util.Date;

public class PersonalShopCar {

    private int id;

    private Date modify;//添加购物车时间

    private User user;//用户

    public PersonalShopCar() {
    }

    public PersonalShopCar(int id, Date modify, User user) {
        this.id = id;
        this.modify = modify;
        this.user = user;
    }
}
