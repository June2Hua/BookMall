package com.hua.service.impl;


import com.hua.dao.IUserDao;
import com.hua.dao.impl.UserDaoImpl;
import com.hua.domain.User;
import com.hua.service.IUserService;

public class UserServiceImpl implements IUserService {

    IUserDao loginDao=new UserDaoImpl();

    /**
     * 保存用户
     * @param user
     */
    @Override
    public void saveUser(User user) {
        loginDao.saveUser(user);
    }

    /**
     * 更新用户信息
     * @param user
     */
    @Override
    public boolean updateUser(User user) {
        if(user==null){
            System.out.println("用户为空，错误");
            return false;
        }
        boolean result = loginDao.updateUser(user);
        if(result==false){
            System.out.println("更新失败");
            return false;
        }
        return true;
    }

    /**
     *
     * @param id
     */
    @Override
    public User getUserById(String id) {
        return loginDao.getUserByid(id);
    }

    /**
     * 核对用户是否正确，错误则返回User=null；
     * @param id
     * @param psw
     * @return
     */
    @Override
    public User checkUser(String id, String psw) {
        if(id==null||psw==null){
            System.out.println("账号或者密码为空");
            return null;
        }
        User user = loginDao.getUserByid(id);
        if(user==null||!(psw.equals(user.getPsw()))){
            System.out.println("用户名或者密码错误");
            user=null;//如果密码错误的话，将user设置为null
        }
        return user;
    }
}
