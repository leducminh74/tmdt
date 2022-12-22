package com.example.tmdt.controller.user_controller;

import com.example.tmdt.beans.Account;
import com.example.tmdt.service.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ToSellerController", value = "/toSeller")
public class ToSellerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        int uId = a.getUserId();
        AccountService.getInstance().toSeller(uId);
        session.removeAttribute("acc");
        session.removeAttribute("redirectURL");
        response.sendRedirect("login");

    }
}
