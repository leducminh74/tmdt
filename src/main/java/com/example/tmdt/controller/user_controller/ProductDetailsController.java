package com.example.tmdt.controller.user_controller;

import com.example.tmdt.beans.Category;
import com.example.tmdt.beans.Product;
import com.example.tmdt.service.CategoryService;
import com.example.tmdt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductDetailsController", value = "/details")
public class ProductDetailsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String id = request.getParameter("pid");
            String brand = request.getParameter("brand");

            Product p = ProductService.getInstance().getProductById(id);
            List<Product> listSP = ProductService.getInstance().getProductByBrand(brand);
            List<Category> listC = CategoryService.getInstance().getAllCategory();

            request.setAttribute("listC",listC);
            request.setAttribute("details", p);
            request.setAttribute("sameP", listSP);

            request.getRequestDispatcher("details_product.jsp").forward(request,response);
        }catch (Exception e){

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
