package com.example.tmdt.controller.admin_controller;

import com.example.tmdt.beans.Account;
import com.example.tmdt.beans.OrderDetail;
import com.example.tmdt.beans.Product;
import com.example.tmdt.service.AdminService;
import com.example.tmdt.service.ProductService;
import com.example.tmdt.service.SellerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

@WebServlet(name = "RevenueManagementController", value = "/admin/revenue-management")
public class RevenueManagementController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        Account a = (Account) httpSession.getAttribute("acc");
        if(a.getRole() == 1){

            double totalRevenue = AdminService.getInstance().totalRevenue();
            int currentMonth = Calendar.getInstance().get(Calendar.MONTH) +1 ;
            double totalRevenueByMonth = AdminService.getInstance().getRevenueByMonth(currentMonth);
            int totalOrderStatusPending = AdminService.getInstance().getTotalOrderStatusPending();
            int totalAccountIsSeller = AdminService.getInstance().getTotalAccountIsSeller();

            request.setAttribute("totalRevenue",totalRevenue);
            request.setAttribute("totalRevenueByMonth",totalRevenueByMonth);
            request.setAttribute("totalOrderStatusPending",totalOrderStatusPending);
            request.setAttribute("totalAccountIsSeller",totalAccountIsSeller);
            request.getRequestDispatcher("revenue-management.jsp").forward(request,response);
        }else if(a.getRole() == 2){
            List<OrderDetail> orderDetailList = SellerService.getInstance().getOrderDetailSuccess(a.getUserId());
            double totalRevenue = SellerService.getInstance().totalRevenue(orderDetailList);
            int currentMonth = Calendar.getInstance().get(Calendar.MONTH) +1 ;
            double totalRevenueByMonth = SellerService.getInstance().totalRevenue(SellerService.getInstance().getOrderDetailSuccessByMonth(currentMonth,a.getUserId()));
            int totalOrderStatusPending = SellerService.getInstance().getTotalOrderStatusPending(a.getUserId());

            request.setAttribute("totalRevenue",totalRevenue);
            request.setAttribute("totalRevenueByMonth",totalRevenueByMonth);
            request.setAttribute("totalOrderStatusPending",totalOrderStatusPending);
            request.getRequestDispatcher("revenue-management.jsp").forward(request,response);

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        Account a = (Account) httpSession.getAttribute("acc");
        if(a.getRole() == 1){
            String sMonth = request.getParameter("month");
            int month = 0;
            if(sMonth.equals("0")){
                month = Calendar.getInstance().get(Calendar.MONTH) +1 ;
            }else{
                month = Integer.parseInt(sMonth);
            }
            double totalRevenueByMonth = AdminService.getInstance().getRevenueByMonth(month);
            PrintWriter out = response.getWriter();
            out.println(totalRevenueByMonth);
        }else if(a.getRole() == 2){
            String sMonth = request.getParameter("month");
            int month = 0;
            if(sMonth.equals("0")){
                month = Calendar.getInstance().get(Calendar.MONTH) +1 ;
            }else{
                month = Integer.parseInt(sMonth);
            }
            List<OrderDetail> orderDetailList = SellerService.getInstance().getOrderDetailSuccessByMonth(month,a.getUserId());
            double totalRevenueByMonth = SellerService.getInstance().totalRevenue(orderDetailList);
            PrintWriter out = response.getWriter();
            out.println(totalRevenueByMonth);
        }

    }
}
