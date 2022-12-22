package com.example.tmdt.controller.admin_controller;

import com.example.tmdt.beans.Account;
import com.example.tmdt.beans.Order;
import com.example.tmdt.beans.OrderDetail;
import com.example.tmdt.service.AdminService;
import com.example.tmdt.service.SellerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderManagementController", value = "/admin/order-management")
public class OrderManagementController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        Account a = (Account) httpSession.getAttribute("acc");
        if(a.getRole() == 1){
            List<Order> orderList = AdminService.getInstance().getAllOrder();
            request.setAttribute("listOrder",orderList);
            request.getRequestDispatcher("order-management.jsp").forward(request,response);
        }else if(a.getRole() == 2){
            List<OrderDetail> orderDetailList = SellerService.getInstance().getOrderDetailBySId(a.getUserId());
            request.setAttribute("listOrderDetail",orderDetailList);
            request.getRequestDispatcher("order-management.jsp").forward(request,response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
