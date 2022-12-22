package com.example.tmdt.controller.user_controller;

import com.example.tmdt.beans.Account;
import com.example.tmdt.beans.Infomation;
import com.example.tmdt.dao.AccountDao;
import com.example.tmdt.service.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "InfoUserController", value = "/info")
public class InfoUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Account a  = (Account) session.getAttribute("acc");

        int user_id = a.getUserId();

        Infomation i = AccountDao.getInstance().viewInfo(user_id);

        String name1 = i.getName();
        String address1 = i.getAddress();

        request.setAttribute("name",name1);
        request.setAttribute("address", address1);
        System.out.println("load trên");

        request.getRequestDispatcher("infouser.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Account a  = (Account) session.getAttribute("acc");

        int user_id = a.getUserId();

        String name = request.getParameter("name");
        String address = request.getParameter("address");
        request.setAttribute("error","Cập nhật thông tin thành công");
        AccountDao.getInstance().info(user_id,name,address);
        Infomation i = AccountDao.getInstance().viewInfo(user_id);

        String name1 = i.getName();
        String address1 = i.getAddress();
        request.setAttribute("name",name1);
        request.setAttribute("address", address1);

        request.getRequestDispatcher("infouser.jsp").forward(request,response);


    }
}
