package com.example.tmdt.controller.admin_controller;

import com.example.tmdt.service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddUserController", value = "/admin/addUser")
public class AddUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone");
        String role = request.getParameter("role");

        AdminService.getInstance().addUser(username,password,email,phoneNumber,role);
        response.sendRedirect("/tmdt_war_exploded/admin/user-management");
    }
}
