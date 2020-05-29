package com.hua.controller;

import com.hua.domain.User;
import com.hua.service.IUserService;
import com.hua.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/alterPsw")
public class AlterPswController extends HttpServlet {

    IUserService userService=new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/alterPsw.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String new1 = req.getParameter("new1");
        String new2=req.getParameter("new2");
        User user = (User) req.getSession().getAttribute("user");
        user.setPsw(new1);
        boolean result = userService.updateUser(user);
        //修改成功，跳转到主页
        if(result){
            resp.sendRedirect("/company/index.jsp");
            return ;
        }
    }
}
