package com.example.tmdt.controller.user_controller;

import com.example.tmdt.beans.Category;
import com.example.tmdt.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderSuccessController", value = "/ordersuccess")
public class OrderSuccessController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> listC = CategoryService.getInstance().getAllCategory();

        request.setAttribute("listC",listC);
        request.getRequestDispatcher("order-success.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
