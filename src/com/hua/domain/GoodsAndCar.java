package com.hua.domain;

/**
 * 个人购物车和商品关系表
 */
public class GoodsAndCar {

    int goodsId;

    int carId;

    int count;

    public GoodsAndCar() {
    }

    public GoodsAndCar(int goodsId, int carId, int count) {
        this.goodsId = goodsId;
        this.carId = carId;
        this.count = count;
    }

    @Override
    public String toString() {
        return "GoodsAndCar{" +
                "goodsId=" + goodsId +
                ", carId=" + carId +
                ", count=" + count +
                '}';
    }

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
