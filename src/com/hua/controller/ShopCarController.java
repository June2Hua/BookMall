package com.hua.controller;

import com.hua.domain.User;
import com.hua.service.IShopCarService;
import com.hua.service.impl.ShopCarServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 处理购物车请求的类
 */
@WebServlet("/shopCar")
public class ShopCarController extends HttpServlet {

    IShopCarService shopCarService=new ShopCarServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("ShopCarController");
        String goodsId = req.getParameter("goodsId");
        System.out.println(goodsId);
        //获得session中的用户
        User user = (User)req.getSession().getAttribute("user");
        System.out.println(user);
        //添加购物车
        shopCarService.addGoodsToShopCar(user.getId(), Integer.valueOf(goodsId));
    }
}
