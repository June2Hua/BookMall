package com.hua.dao.impl;

import com.hua.dao.IGoodsDao;
import com.hua.dao.IOrderDao;
import com.hua.dao.IUserDao;
import com.hua.domain.Goods;
import com.hua.domain.UserOrder;
import com.hua.utils.ConnnectionUtil;

import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class OrderDaoImpl implements IOrderDao {

    /**
     * 通过orderId查询该订单的商品
     * @param orderId
     * @return 返回商品和数量
     */
    public Map<Goods,Integer> getGoodsByOrderId(Integer orderId){
        String sql="select gid,count from orderAndGoods,userOrder where oid=id and oid="+orderId;
        //结果集
        ResultSet resultSet=null;
        Map<Goods,Integer> map=new HashMap<>();
        try(Connection connection = ConnnectionUtil.getConnection();
            Statement statement=connection.createStatement()){
            resultSet = statement.executeQuery(sql);
            IGoodsDao goodsDao=new GoodsDaoImpl();
            while(resultSet.next()){
                int count = resultSet.getInt("count");
                int gid = resultSet.getInt("gid");
                Goods goods = goodsDao.getGoodsById(gid);
                map.put(goods, count);
            }
        }catch (Exception exception){
            exception.printStackTrace();
            return null;
        }
        return map;
    }

    /**
     * 获得订单信息
     * @param orderId
     * @return
     */
    @Override
    public UserOrder getUserOrder(Integer orderId) {
        //查询sql语句
        String sql="select * from userOrder where id="+orderId;
        //结果集
        ResultSet resultSet=null;
        //封装结果集
        UserOrder userOrder=null;
        try(Connection connection = ConnnectionUtil.getConnection();
            Statement statement=connection.createStatement()){
            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                int id = resultSet.getInt("id");
                Date modify = resultSet.getDate("modify");
                int state = resultSet.getInt("state");
                String uid = resultSet.getString("uid");
                IUserDao userDao=new UserDaoImpl();
                userOrder=new UserOrder(id,modify,state,userDao.getUserByid(uid));
            }
        }catch (Exception exception){
            exception.printStackTrace();
            return null;
        }
        return userOrder;
    }

    /**
     * 保存订单信息
     * @param carId
     * @param uid
     * @return 返回订单的id
     */
    @Override
    public Integer saveOrder(Integer carId,Integer uid) {
        //判断是否正确
        if(carId==null){
            System.err.println("saveOrder------输入carId错误");
            return -1;
        }
        Integer orderId = createOrder(uid);//创建订单
        createOrderAndGoods(carId,orderId);//创建订单与商品
        updateGoodsCount(carId);//更新对应的商品数量

        return orderId;
    }

    /**
     * 创建订单
     * @return 返回新创建的订单自增id
     */
    private Integer createOrder(Integer uid){
        //插入sql语句
        String sql="insert into userOrder(modify,state,uid) values(?,?,?)";
        //结果集
        ResultSet resultSet=null;
        //封装结果集
        UserOrder userOrder=null;
        //结果
        int result=0;
        //时间
        java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
        //生成的id
        int orderId=0;
        int state=1;
        try(Connection connection = ConnnectionUtil.getConnection();
            PreparedStatement statement=connection.prepareStatement(sql)){

            statement.setDate(1, date);
            statement.setInt(2, state);
            statement.setString(3, String.valueOf(uid));

            result = statement.executeUpdate();
            ResultSet generatedKeys = statement.getGeneratedKeys();
            if(generatedKeys.next())
                orderId=generatedKeys.getInt(1);
        }catch (Exception exception){
            exception.printStackTrace();
            return -1;
        }
        if(result==0)
            return null;
        return orderId;
    }

    /**
     * 创建订单和商品的联系
     * @param carId
     * @param orderId
     * @return
     */
    private Integer createOrderAndGoods(Integer carId,Integer orderId){
        IGoodsDao goodsDao=new GoodsDaoImpl();
        Map<Goods, Integer> goodsMap = goodsDao.getGoodsByShopCarId(carId);
        Set<Map.Entry<Goods, Integer>> entries = goodsMap.entrySet();

        //插入sql语句
        String sql="insert into orderAndGoods(oid,gid,count) values(?,?,?)";

        try(Connection connection = ConnnectionUtil.getConnection();
            PreparedStatement statement=connection.prepareStatement(sql)){

            for (Map.Entry<Goods,Integer> entry :entries){
                statement.setInt(1, orderId);
                statement.setInt(2, entry.getKey().getId());
                statement.setInt(3, entry.getValue());
                statement.executeUpdate();
            }
        }catch (Exception exception){
            exception.printStackTrace();
            return -1;
        }
        return 0;
    }

    /**
     * 更新商品的数量
     * @param carId
     */
    private void updateGoodsCount(Integer carId){
        IGoodsDao goodsDao=new GoodsDaoImpl();
        Map<Goods, Integer> goodsMap = goodsDao.getGoodsByShopCarId(carId);
        Set<Map.Entry<Goods, Integer>> entries = goodsMap.entrySet();

    }
}
