package com.hua.dao.impl;

import com.hua.dao.IGoodsDao;
import com.hua.dao.IUserDao;
import com.hua.domain.Goods;
import com.hua.domain.User;
import com.hua.utils.ConnnectionUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class GoodsDaoImpl implements IGoodsDao {

    IUserDao userDao=new UserDaoImpl();

    @Override
    public List<Goods> getLastestGoods() {
        //查询sql语句,根据时间倒序查询前十个
        String sql="SELECT * from goods ORDER BY `modify` DESC LIMIT 0,10;";
        //结果集
        ResultSet resultSet=null;
        //封装结果集
        LinkedList<Goods> list=new LinkedList<>();
        try(Connection connection = ConnnectionUtil.getConnection();
            Statement statement=connection.createStatement()){
            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                //结果集转为list集合
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                Date modify=resultSet.getDate("modify");
                String remark=resultSet.getString("remark");
                double price=resultSet.getDouble("price");
                int sort=resultSet.getInt("sort");
                int count=resultSet.getInt("count");
                int sales=resultSet.getInt("sales");
                String uid=resultSet.getString("uid");
                String image=resultSet.getString("image");
                Goods goods=new Goods(id,name,modify,remark,price,sort,count,sales,userDao.getUserByid(uid),image);
                list.add(goods);
            }
        }catch (Exception exception){
            exception.printStackTrace();
            return null;
        }
        return list;
    }

    /**
     * 查询所有的商品
     * @return
     */
    @Override
    public List<Goods> getAll() {
        //查询sql语句
        String sql="SELECT * from goods";
        //结果集
        ResultSet resultSet=null;
        //封装结果集
        LinkedList<Goods> list=new LinkedList<>();
        try(Connection connection = ConnnectionUtil.getConnection();
            Statement statement=connection.createStatement()){
            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                //结果集转为list集合
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                Date modify=resultSet.getDate("modify");
                String remark=resultSet.getString("remark");
                double price=resultSet.getDouble("price");
                int sort=resultSet.getInt("sort");
                int count=resultSet.getInt("count");
                int sales=resultSet.getInt("sales");
                String uid=resultSet.getString("uid");
                String image=resultSet.getString("image");
                Goods goods=new Goods(id,name,modify,remark,price,sort,count,sales,userDao.getUserByid(uid),image);
                list.add(goods);
            }
        }catch (Exception exception){
            exception.printStackTrace();
            return null;
        }
        return list;
    }

    @Override
    public boolean saveGoods() {
        return false;
    }

    /**
     * 根据id获取商品
     * @param
     * @return
     */
    @Override
    public Goods getGoodsById(Integer inputId) {
        if(inputId==null){
            System.out.println("id错误");
            return null;
        }
        //查询sql语句,根据时间倒序查询前十个
        String sql="SELECT * from goods where id="+inputId;
        //结果集
        ResultSet resultSet=null;
        //封装结果集
        Goods goods=null;
        try(Connection connection = ConnnectionUtil.getConnection();
            Statement statement=connection.createStatement()){
            resultSet = statement.executeQuery(sql);
            if(resultSet.next()){
                //结果集转为list集合
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                Date modify=resultSet.getDate("modify");
                String remark=resultSet.getString("remark");
                double price=resultSet.getDouble("price");
                int sort=resultSet.getInt("sort");
                int count=resultSet.getInt("count");
                int sales=resultSet.getInt("sales");
                String uid=resultSet.getString("uid");
                String image=resultSet.getString("image");
                goods=new Goods(id,name,modify,remark,price,sort,count,sales,userDao.getUserByid(uid),image);
            }
        }catch (Exception exception){
            exception.printStackTrace();
            return null;
        }
        return goods;
    }

    //测试
    public static void main(String[] args) {
        IGoodsDao goodsDao=new GoodsDaoImpl();
//        List<Goods> lastestGoods = goodsDao.getLastestGoods();
//        for (Goods goods:lastestGoods)
//            System.out.println(goods);
        System.out.println(goodsDao.getGoodsById(13));
    }
}
