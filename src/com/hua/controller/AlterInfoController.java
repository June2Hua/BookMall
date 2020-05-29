package com.hua.controller;

import com.hua.domain.User;
import com.hua.service.IUserService;
import com.hua.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/alterInfo")
public class AlterInfoController extends HttpServlet {

    IUserService userService=new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/alterInfo.jsp").forward(req, resp);
    }

    /**
     * post请求
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String ageString = req.getParameter("age");
        int age = Integer.valueOf(ageString);
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String city = req.getParameter("city");
        User u = (User) req.getSession().getAttribute("user");
        User user = new User(id, name, u.getPsw(), age, phone, address, city);
        System.out.println(user);
        boolean result = userService.updateUser(user);
        //如果更新成功，修改session
        if(result){
            req.getSession().setAttribute("user",user );
            resp.sendRedirect("/company/index.jsp");
        }else{
            resp.sendRedirect("/company/index.jsp");
        }
    }
}
