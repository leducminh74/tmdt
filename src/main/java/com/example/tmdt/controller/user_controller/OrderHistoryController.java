package com.example.tmdt.controller.user_controller;

import com.example.tmdt.beans.Account;
import com.example.tmdt.beans.Category;
import com.example.tmdt.beans.Order;
import com.example.tmdt.service.CategoryService;
import com.example.tmdt.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderHistoryController", value = "/orderhistory")
public class OrderHistoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account a  = (Account) session.getAttribute("acc");

        List<Order> orderList = OrderService.getInstance().getAllOrderActive(a);
        List<Category> listC = CategoryService.getInstance().getAllCategory();

        request.setAttribute("listC",listC);
        request.setAttribute("oList", orderList);
        request.getRequestDispatcher("orderhistory.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
