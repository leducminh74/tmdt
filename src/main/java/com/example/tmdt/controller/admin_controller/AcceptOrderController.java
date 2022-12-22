package com.example.tmdt.controller.admin_controller;

import com.example.tmdt.beans.Order;
import com.example.tmdt.beans.OrderDetail;
import com.example.tmdt.service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AcceptOrderController", value = "/admin/acceptOrder")
public class AcceptOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oId = request.getParameter("id");
        Order o = AdminService.getInstance().acceptOrder(oId);
        OrderDetail orderDetail = AdminService.getInstance().acceptOrderDetail(oId);
        if(o == null || orderDetail == null){
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}
