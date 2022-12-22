package com.example.tmdt.controller.admin_controller;

import com.example.tmdt.beans.Account;
import com.example.tmdt.service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserManagementController", value = "/admin/user-management")
public class UserManagementController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Account> aList = AdminService.getInstance().getAllAccount();
        request.setAttribute("listA",aList);
        request.getRequestDispatcher("user-management.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
