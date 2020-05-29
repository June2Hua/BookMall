package com.hua.service;

import com.hua.domain.User;

public interface IUserService {

    void saveUser(User user);

    User getUserById(String id);

    User checkUser(String id,String psw);

    boolean updateUser(User user);
}
