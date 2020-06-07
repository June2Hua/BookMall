package com.hua.dao.impl;

import com.hua.dao.IPersonalShopCar;
import com.hua.dao.IUserDao;
import com.hua.domain.PersonalShopCar;
import com.hua.domain.User;
import com.hua.utils.ConnnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

public class PersonalShopCarImpl implements IPersonalShopCar {

    //查询用户类
    IUserDao userDao=new UserDaoImpl();

    /**
     * 创建购物车
     * @param userId
     * @return
     */
    @Override
    public PersonalShopCar savePersonalShopCar(String userId) {
        //判断是否正确
        if(userId==null){
            System.err.println("savePersonalShopCar------输入id错误");
            return null;
        }
        //插入sql语句
        String sql="insert into personalShopCar(modify,uid) values(?,?)";
        //结果集
        ResultSet resultSet=null;
        //封装结果集
        PersonalShopCar car=null;
        //结果
        int result=0;
        //时间
        java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
        //生成的id
        int carId=0;
        try(Connection connection = ConnnectionUtil.getConnection();
            PreparedStatement statement=connection.prepareStatement(sql)){
            statement.setDate(1, date);
            statement.setString(2, userId);
            result = statement.executeUpdate();
            ResultSet generatedKeys = statement.getGeneratedKeys();
            if(generatedKeys.next())
                carId=generatedKeys.getInt(1);
        }catch (Exception exception){
            exception.printStackTrace();
            return null;
        }
        if(result==0)
            return null;
        return new PersonalShopCar(carId, date, userId);
    }

    /**
     * 根据用户的id，查询出用户对应的购物车
     * @param userId
     * @return
     */
    @Override
    public PersonalShopCar findPersonalShopCarByUserId(String userId) {
        //判断是否正确
        if(userId==null){
            System.err.println("findPersonalShopCarByUserId------查询不到该用户错误");
            return null;
        }
        //查询sql语句
        String sql="SELECT * from personalShopCar where uid="+"\'"+userId+"\'";
        //结果集
        ResultSet resultSet=null;
        //封装结果集
        PersonalShopCar car=null;
        try(Connection connection = ConnnectionUtil.getConnection();
            Statement statement=connection.createStatement()){
            resultSet = statement.executeQuery(sql);
            if(resultSet.next()){
                //结果集转为list集合
                int id=resultSet.getInt("id");
                Date modify=resultSet.getDate("modify");
                car=new PersonalShopCar(id,modify,userId);
            }
        }catch (Exception exception){
            exception.printStackTrace();
            return null;
        }
        return car;
    }
}
