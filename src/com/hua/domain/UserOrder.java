package com.hua.domain;

import java.io.Serializable;
import java.util.Date;

public class UserOrder implements Serializable {

    private int id;

    private Date modify;//用户订单创建时间

    private int state;//状态

    private User user;//对应的用户

    public UserOrder(){}

    public UserOrder(int id, Date modify, int state, User user) {
        this.id = id;
        this.modify = modify;
        this.state = state;
        this.user = user;
    }

    @Override
    public String toString() {
        return "UserOrder{" +
                "id=" + id +
                ", modify=" + modify +
                ", state=" + state +
                ", user=" + user +
                '}';
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

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getStateInfo(){
        if (state==1)
            return "待发货";
        if(state==2)
            return "待收货";
        if(state==3)
            return "待评价";
        if(state==4)
            return "退款";
        return "其他";
    }
}
