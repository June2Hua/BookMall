package com.hua.controller;

import com.hua.domain.User;
import com.hua.service.IOrderService;
import com.hua.service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/placeOrder")
public class PlaceOrderController extends HttpServlet {

    IOrderService orderService=new OrderServiceImpl();

    /**
     * 下单
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //传输购物车的id
        String carId = req.getParameter("carId");
        System.out.println("购物车id为---"+carId);
        //下单
        //获得session中的用户
        User user = (User)req.getSession().getAttribute("user");
        System.out.println(user);
        int uid=Integer.valueOf(user.getId());
        Integer orderId = orderService.placeAnOrder(Integer.valueOf(carId), uid);

        //跳转到订单信息页面
        req.setAttribute("orderId",orderId );
        req.getRequestDispatcher("/WEB-INF/showOrderInfo.jsp").forward(req, resp);

    }
}
