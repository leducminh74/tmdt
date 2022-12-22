package com.example.tmdt.controller.admin_controller;

import com.example.tmdt.beans.Order;
import com.example.tmdt.beans.OrderDetail;
import com.example.tmdt.service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CancelOrder", value = "/admin/cancelOrder")
public class CancelOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oId = request.getParameter("id");
        Order o = AdminService.getInstance().cancelOrder(oId);
        OrderDetail orderDetail = AdminService.getInstance().cancelOrderDetail(oId);
        if(o == null || orderDetail == null){
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}
