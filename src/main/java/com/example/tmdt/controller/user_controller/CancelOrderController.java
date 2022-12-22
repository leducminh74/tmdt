package com.example.tmdt.controller.user_controller;

import com.example.tmdt.beans.Account;
import com.example.tmdt.beans.Order;
import com.example.tmdt.beans.OrderDetail;
import com.example.tmdt.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "CancelOrderController", value = "/cancelOrder")
public class CancelOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String orderId = request.getParameter("orderId");
        List<OrderDetail> orderDetailList = OrderService.getInstance().getAllOrderDetailByOrderId(Integer.parseInt(orderId));
        for (OrderDetail od: orderDetailList) {
            OrderService.getInstance().updateProductQuantityCancelOrder(od);
        }
        OrderService.getInstance().cancelOrderByOrderId(orderId);
        OrderService.getInstance().cancelOrderDetailByOrderId(orderId);

        Account a  = (Account) session.getAttribute("acc");
        List<Order> orderList = OrderService.getInstance().getAllOrderActive(a);
        PrintWriter out = response.getWriter();
        if(orderList.size() == 0){
            out.println(" <div id=\"empty-cart\">\n" +
                    "                <h2 class=\"text-center m-8 \"><strong>Bạn chưa có đơn hàng nào?</strong></h2>\n" +
                    "                <button style=\"display: block; margin: 0 auto\" type=\"button\" class=\"btn btn-lg btn-primary mt-2\" onclick=\"location.href ='index' \">Đặt hàng ngay</button>\n" +
                    "            </div>");
        }
    }
}
