package com.example.tmdt.controller.admin_controller;

import com.example.tmdt.beans.Order;
import com.example.tmdt.beans.OrderDetail;
import com.example.tmdt.service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "NextStepOrderController", value = "/admin/nextStepOrder")
public class NextStepOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oId = request.getParameter("id");
        String oStatus = request.getParameter("status");
        Order o = AdminService.getInstance().nextStepOrder(oId,oStatus);
        OrderDetail orderDetail = AdminService.getInstance().nextStepOrderDetail(oId,oStatus);
        if(o == null || orderDetail == null){
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}
