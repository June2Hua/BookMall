package com.hua.domain;

import java.util.Date;

/**
 * 商品
 */
public class Goods {

    private int id;

    private String name;

    private Date modify;//商品上架时间

    private String remark;//详细信息

    private double price;

    private int sort;//类型

    private int count;//剩余数量

    private int sales;//月销量

    private User user;//发布用户

    private String image;//图片地址

    public Goods() { }

    public Goods(int id, String name, Date modify, String remark, double price, int sort, int count, int sales, User user, String image) {
        this.id = id;
        this.name = name;
        this.modify = modify;
        this.remark = remark;
        this.price = price;
        this.sort = sort;
        this.count = count;
        this.sales = sales;
        this.user = user;
        this.image = image;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", modify=" + modify +
                ", remark='" + remark + '\'' +
                ", price=" + price +
                ", sort=" + sort +
                ", count=" + count +
                ", sales=" + sales +
                ", user=" + user +
                ", image='" + image + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getModify() {
        return modify;
    }

    public void setModify(Date modify) {
        this.modify = modify;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getSales() {
        return sales;
    }

    public void setSales(int sales) {
        this.sales = sales;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
