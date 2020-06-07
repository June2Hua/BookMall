package com.hua.dao.impl;

import com.hua.dao.IGoodsAndCar;
import com.hua.dao.IUserDao;
import com.hua.domain.Goods;
import com.hua.domain.GoodsAndCar;
import com.hua.domain.PersonalShopCar;
import com.hua.domain.User;
import com.hua.utils.ConnnectionUtil;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

public class GoodsAndCarImpl implements IGoodsAndCar {

    /**
     * 根据商品id和购物车id，更新商品和购物车的关联关系表,主要更新数量
     * @param goodsId
     * @param carId
     * @param count
     * @return
     */
    @Override
    public boolean updateGoodsAndCar(Integer goodsId, Integer carId, Integer count) {
        //更新语句
        String sql="update goodsAndCar set count =? where gid=? and cid=?";
        //结果
        int result=0;
        try(Connection connection = ConnnectionUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setInt(1,count );
            preparedStatement.setInt(2,goodsId );
            preparedStatement.setInt(3,carId );
            result = preparedStatement.executeUpdate();
        }catch (Exception exception){
            exception.printStackTrace();
            return false;
        }
        //如果受影响的行为0，说明失败，否则成功
        return result==0?false:true;
    }

    /**
     * 根据商品id和购物车，创建商品和购物车的关联关系表，数量默认为1
     * @param goodsId
     * @param carId
     * @return
     */
    @Override
    public boolean saveGoodsAndCar(Integer goodsId, Integer carId) {
        //插入语句，默认数量为0
        String sql="insert into goodsAndCar(cid,gid,count) values (?,?,1)";
        //结果
        int result=0;
        try(Connection connection = ConnnectionUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt(1,carId );
            preparedStatement.setInt(2,goodsId );
            result = preparedStatement.executeUpdate();
        }catch (Exception exception){
            exception.printStackTrace();
            return false;
        }
        //如果受影响的行为0，说明失败，否则成功
        return result==0?false:true;
    }

    /**
     * 根据商品id和购物车id查询（商品和购物车关系表）
     * @param goodsId
     * @param carId
     * @return
     */
    @Override
    public GoodsAndCar getGoodsAndCarByGoodsIdAndCarId(Integer goodsId, Integer carId) {
        //查询sql语句
        String sql="SELECT * from goodsAndCar where cid="+carId+" and gid="+goodsId;
        //结果集
        ResultSet resultSet=null;
        //封装结果集
        GoodsAndCar goodsAndCar=null;
        try(Connection connection = ConnnectionUtil.getConnection();
            Statement statement=connection.createStatement()){
            resultSet = statement.executeQuery(sql);
            if(resultSet.next()){
                //结果集转为list集合
                int cid=resultSet.getInt("cid");
                int gid=resultSet.getInt("gid");
                int count=resultSet.getInt("count");
                goodsAndCar=new GoodsAndCar(gid,cid,count);
            }
        }catch (Exception exception){
            exception.printStackTrace();
            return null;
        }
        return goodsAndCar;
    }
}
