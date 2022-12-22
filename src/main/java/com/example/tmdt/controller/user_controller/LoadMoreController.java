package com.example.tmdt.controller.user_controller;

import com.example.tmdt.beans.Product;
import com.example.tmdt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "LoadMoreController", value = "/loadmore")
public class LoadMoreController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String amount = request.getParameter("amount");
        int iAmount = Integer.parseInt(amount);
        List<Product> listP = ProductService.getInstance().getNextTop8(iAmount);

        PrintWriter out = response.getWriter();
        for (Product p: listP) {
            out.println("<div class=\"product col-lg-3 col-md-4 col-sm-6 pb-1\">\n" +
                    "            <div class=\"product-item bg-light mb-4\">\n" +
                    "                <div class=\"product-img position-relative overflow-hidden\">\n" +
                    "                    <img class=\"img-fluid w-100\" src=\"img/"+p.getImg()+"\" alt=\"\">\n" +
                    "                    <div class=\"product-action\">\n" +
                    "                        <a class=\"addToCart btn btn-outline-dark btn-square\" pid=\""+p.getId()+"\" pname=\""+p.getName()+"\" pprice=\""+p.getSellPrice()+"\" pquantity=\""+p.getQuantity()+"\"><i class=\"fa fa-shopping-cart\"></i></a>"+
                    "                        <a class=\"btn btn-outline-dark btn-square\" href=\"details?pid="+p.getId()+"&brand="+p.getBrand()+"\"><i class=\"fa fa-search\"></i></a>"+
                    "                    </div>\n" +
                    "                </div>\n" +
                    "                <div class=\"text-center py-4\">\n" +
                    "                    <a class=\"h6 text-decoration-none text-truncate\" href=\"\">"+p.getName()+"</a>\n" +
                    "                    <div class=\"d-flex align-items-center justify-content-center mt-2\">\n" +
                    "                        <h5>"+p.getSellPrice()+"</h5><h6 class=\"text-muted ml-2\"><del>"+p.getPrice()+"</del></h6>\n" +
                    "                    </div>\n" +
                    "                    <div class=\"d-flex align-items-center justify-content-center mb-1\">\n" +
                    "                        <small class=\"fa fa-star text-primary mr-1\"></small>\n" +
                    "                        <small class=\"fa fa-star text-primary mr-1\"></small>\n" +
                    "                        <small class=\"fa fa-star text-primary mr-1\"></small>\n" +
                    "                        <small class=\"far fa-star text-primary mr-1\"></small>\n" +
                    "                        <small class=\"far fa-star text-primary mr-1\"></small>\n" +
                    "                        <small>("+p.getTotalSold()+")</small>\n" +
                    "                    </div>\n" +
                    "                </div>\n" +
                    "            </div>\n" +
                    "        </div>");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
