package com.hua.dao;

import com.hua.domain.User;

public interface IUserDao {

    /**
     * 获取用户信息
     */
    User getUserByid(String id);

    /**
     * 根据id更新用户信息
     * @param user
     */
    boolean updateUser(User user);

    /**
     * 插入用户数据
     * @param user
     */
    User saveUser(User user);


}
