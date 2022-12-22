package com.example.tmdt.controller.admin_controller;

import com.example.tmdt.beans.Account;
import com.example.tmdt.service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ActiveAccountController", value = "/admin/activeAccount")
public class ActiveAccountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String a_id = request.getParameter("id");
        Account a = AdminService.getInstance().activeAccount(a_id);
        if(a == null){
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}
