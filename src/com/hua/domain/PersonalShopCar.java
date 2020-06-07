package com.hua.domain;

import java.util.Date;

public class PersonalShopCar {

    private int id;

    private Date modify;//添加购物车时间

    private String uid;

    public PersonalShopCar() {
    }

    @Override
    public String toString() {
        return "PersonalShopCar{" +
                "id=" + id +
                ", modify=" + modify +
                ", uid='" + uid + '\'' +
                '}';
    }

    public PersonalShopCar(int id, Date modify, String uid) {
        this.id = id;
        this.modify = modify;
        this.uid = uid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getModify() {
        return modify;
    }

    public void setModify(Date modify) {
        this.modify = modify;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }
}
