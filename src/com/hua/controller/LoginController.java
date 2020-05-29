package com.hua.controller;

import com.hua.domain.User;
import com.hua.service.IUserService;
import com.hua.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * 登录并验证登录功能
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {

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
        String psw = req.getParameter("psw");
        User user = loginService.checkUser(id, psw);
        System.out.println(id+"---"+psw);
        if(user==null){
            System.out.println("账户或者密码错误");
            req.getSession().setAttribute("errorOfAccOrPsw", "账户或者密码错误");
            resp.sendRedirect("/company/login.jsp");
            return ;
        }else{
            System.out.println("存在该用户");
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            session.removeAttribute("errorOfAccOrPsw");
            resp.sendRedirect("/company/index.jsp");
        }
    }
}
