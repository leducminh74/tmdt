package com.example.tmdt.controller.admin_controller;

import com.example.tmdt.beans.Account;
import com.example.tmdt.beans.Category;
import com.example.tmdt.beans.Product;
import com.example.tmdt.service.AdminService;
import com.example.tmdt.service.CategoryService;
import com.example.tmdt.service.SellerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductManagementController", value = "/admin/product-management")
public class ProductManagementController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        Account a = (Account) httpSession.getAttribute("acc");
        if(a.getRole() == 1){
            List<Product> pList = AdminService.getInstance().getAllProducts();
            List<Category> categoryList = CategoryService.getInstance().getAllCategory();

            request.setAttribute("listP",pList);
            request.setAttribute("listC",categoryList);

            request.getRequestDispatcher("product-management.jsp").forward(request,response);
        }else if(a.getRole() == 2){
            List<Product> productList = SellerService.getInstance().getProductBySId(a.getUserId());
            List<Category> categoryList = CategoryService.getInstance().getAllCategory();

            request.setAttribute("listP",productList);
            request.setAttribute("listC",categoryList);

            request.getRequestDispatcher("product-management.jsp").forward(request,response);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
