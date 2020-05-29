package com.hua.controller;

import com.hua.domain.User;
import com.hua.service.IUserService;
import com.hua.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterController extends HttpServlet {

    IUserService loginService=new UserServiceImpl();

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
        String psw = req.getParameter("psw");
        String ageString = req.getParameter("age");
        int age = Integer.valueOf(ageString);
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String city = req.getParameter("city");
        User user = new User(id, name, psw, age, phone, address, city);
        User u= loginService.getUserById(id);
        if(u!=null){
            System.out.println("已存在该账户,注册失败");
            req.getSession().setAttribute("errorExistAcc", "已存在该账户，请重新输入");
            resp.sendRedirect("/company/register.jsp");
            return ;
        }
        req.getSession().removeAttribute("errorOfAccOrPsw");
        System.out.println(user);
        loginService.saveUser(user);
        System.out.println("注册成功");
        //保存到id中
        HttpSession session = req.getSession();
        session.setAttribute("user", user);
        //重定向
        resp.sendRedirect("/company/index.jsp");
    }
}
