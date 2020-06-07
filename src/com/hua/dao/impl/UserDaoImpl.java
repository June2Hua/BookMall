package com.hua.dao.impl;


import com.hua.dao.IUserDao;
import com.hua.domain.User;
import com.hua.utils.ConnnectionUtil;

import java.sql.*;
import java.util.LinkedList;


public class UserDaoImpl implements IUserDao {

    /**
     * 根据id获得用户
     * @return
     */
    @Override
    public User getUserByid(String inputId) {
        //查询sql语句
        String sql="select * from myuser where id="+"\'"+inputId+"\'";
        //结果集
        ResultSet resultSet=null;
        //封装结果集
        LinkedList<User> list=new LinkedList<>();
        try(Connection connection = ConnnectionUtil.getConnection();
            Statement statement=connection.createStatement()){
            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                //结果集转为list集合
                String id=resultSet.getString("id");
                String name=resultSet.getString("name");
                String psw=resultSet.getString("psw");
                Integer age=resultSet.getInt("age");
                String phone=resultSet.getString("phone");
                String address=resultSet.getString("address");
                String city=resultSet.getString("city");
                User user=new User(id,name ,psw ,age ,phone ,address ,city );
                list.add(user);
            }
            if(list.size()==0||list.size()>1){
                System.out.println("错误,查询不到该账户或者账户数量大于1");
                return null;
            }
            if(list.size()>1)
                System.out.println("注入SQL");
        }catch (Exception exception){
            exception.printStackTrace();
            return null;
        }
        return list.get(0);
    }

    /**
     * 更新用户信息
     * @param user
     */
    @Override
    public boolean updateUser(User user) {
        System.out.println("updateUser");
        //更新语句语句
        String sql="update myuser set name=?,psw=?,age=?,phone=?,address=?,city=? where id=?";
        int result=0;
        try(Connection connection = ConnnectionUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setString(1,user.getName() );
            preparedStatement.setString(2,user.getPsw() );
            preparedStatement.setInt(3,user.getAge() );
            preparedStatement.setString(4,user.getPhone() );
            preparedStatement.setString(5,user.getAddress() );
            preparedStatement.setString(6,user.getCity() );
            preparedStatement.setString(7,user.getId() );
            result = preparedStatement.executeUpdate();
        }catch (Exception exception){
            exception.printStackTrace();
        }
        return result==1?true:false;
    }

    /**
     * 保存用户信息
     * @param user
     */
    @Override
    public User saveUser(User user) {
        System.out.println("saveUser");
        //插入语句
        String sql="insert into myuser(id,name,psw,age,phone,address,city) values(?,?,?,?,?,?,?)";
        try(Connection connection = ConnnectionUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setString(1,user.getId() );
            preparedStatement.setString(2,user.getName() );
            preparedStatement.setString(3,user.getPsw() );
            preparedStatement.setInt(4,user.getAge() );
            preparedStatement.setString(5,user.getPhone() );
            preparedStatement.setString(6,user.getAddress() );
            preparedStatement.setString(7,user.getCity() );
            preparedStatement.executeUpdate();
        }catch (Exception exception){
            exception.printStackTrace();
        }
        return user;
    }
}
