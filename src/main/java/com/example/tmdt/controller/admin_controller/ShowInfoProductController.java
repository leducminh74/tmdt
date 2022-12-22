package com.example.tmdt.controller.admin_controller;

import com.example.tmdt.beans.Category;
import com.example.tmdt.beans.Product;
import com.example.tmdt.service.CategoryService;
import com.example.tmdt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ShowInfoProductController", value = "/admin/showInfoProduct")
public class ShowInfoProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        Product p = ProductService.getInstance().getProductById(id);
        List<Category> categoryList = CategoryService.getInstance().getAllCategory();

        PrintWriter out = response.getWriter();
        String category = "";
        String otherBrand = "";
        for (Category c: categoryList) {
            if(c.getcId() == p.getcId()){
                category += "<option value=\""+c.getcId()+"\" selected>"+c.getcName()+"</option>\n";
            }else{
                category += "<option value=\""+c.getcId()+"\">"+c.getcName()+"</option>\n";
            }
        }

        if(p.getcId() == 7){
            otherBrand = "<input type=\"text\" value=\""+p.getBrand()+"\" name=\"otherBrand\" class=\"form-control\" id=\"otherBrand\"  placeholder=\"Enter product brand\">\n";
        }else{
            otherBrand = "<input style=\"display: none\" type=\"text\" value=\""+p.getBrand()+"\" name=\"otherBrand\" class=\"form-control\" id=\"otherBrand\"  placeholder=\"Enter product brand\">\n";

        }

        out.println(" <div class=\"form-group\">\n" +
                "                            <label for=\"name\"><Strong>Tên sản phẩm</Strong></label>\n" +
                "                            <input type=\"text\" value=\""+p.getName()+"\" name=\"productName\" class=\"form-control\" id=\"name\"  placeholder=\"Enter product name\">\n" +
                "<span class=\"form-message\"></span>"+
                "                        </div>\n" +
                "                        <input style=\"display: none\" type=\"text\" name=\"id\" value=\""+p.getId()+"\">"+
                "                        <div class=\"form-group\">\n" +
                "                            <label for=\"brand\"><Strong>Brand</Strong></label>\n" +
                "                            <select name=\"productBrand\" id=\"brand\" class=\"form-control\" onchange=\"changeBrand(this)\">\n" +
                category +
                "                            </select>\n" +
                otherBrand +
                "<span class=\"form-message\"></span>"+
                "                        </div>\n" +
                "                        <div class=\"form-group\">\n" +
                "                            <label for=\"gender\"><Strong>Màu sắc</Strong></label>\n" +
                "                            <input type=\"text\" value=\""+p.getColor()+"\" name=\"gender\" class=\"form-control\" id=\"gender\" placeholder=\"Enter gender\">\n" +
                "<span class=\"form-message\"></span>"+
                "                        </div>\n" +
                "                        <div class=\"form-group\">\n" +
                "                            <label for=\"origin\"><Strong>Thương hiệu</Strong></label>\n" +
                "                            <input type=\"text\" value=\""+p.getBrand()+"\" name=\"productOrigin\" class=\"form-control\" id=\"origin\" placeholder=\"Enter product origin\">\n" +
                "<span class=\"form-message\"></span>"+
                "                        </div>\n" +
                "                        <div class=\"form-group\">\n" +
                "                            <label for=\"concentration\"><Strong>Mô tả</Strong></label>\n" +
                "                            <input type=\"text\" value=\""+p.getDescription()+"\" name=\"productConcentration\" class=\"form-control\" id=\"concentration\" placeholder=\"Enter product concentration\">\n" +
                "<span class=\"form-message\"></span>"+
                "                        </div>\n" +
                "                        <div class=\"form-group\">\n" +
                "                            <label for=\"description\"><Strong>Tính năng nổi bật</Strong></label>\n" +
                "                            <input type=\"text\" value=\""+p.getSalientFeatures()+"\" name=\"productDescription\" class=\"form-control\" id=\"description\" placeholder=\"Enter product description\">\n" +
                "<span class=\"form-message\"></span>"+
                "                        </div>\n" +
                "                        <div class=\"form-group\">\n" +
                "                            <label for=\"price\"><Strong>Price</Strong></label>\n" +
                "                            <input type=\"text\" value=\""+p.getPrice()+"\" name=\"productPrice\" class=\"form-control\" id=\"price\" placeholder=\"Enter product price\">\n" +
                "<span class=\"form-message\"></span>"+
                "                        </div>\n" +
                "                        <div class=\"form-group\">\n" +
                "                            <label for=\"sellPrice\"><Strong>Sell Price</Strong></label>\n" +
                "                            <input type=\"text\" value=\""+p.getSellPrice()+"\" name=\"productSellPrice\" class=\"form-control\" id=\"sellPrice\" placeholder=\"Enter product sell price\">\n" +
                "<span class=\"form-message\"></span>"+
                "                        </div>\n" +
                "                        <div class=\"form-group\">\n" +
                "                            <label for=\"image\"><Strong>Image</Strong></label>\n" +
                "                            <input type=\"file\" value=\""+p.getImg()+"\" name=\"productImage\" class=\"form-control\" id=\"image\" placeholder=\"Enter product image\">\n" +
                "<span class=\"form-message\"></span>"+
                "                        </div>\n" +
                "                        <div class=\"form-group\">\n" +
                "                            <label for=\"quantity\"><Strong>Quantity</Strong></label>\n" +
                "                            <input type=\"text\" value=\""+p.getQuantity()+"\" name=\"productQuantity\" class=\"form-control\" id=\"quantity\" placeholder=\"Enter product quantity\">\n" +
                "<span class=\"form-message\"></span>"+
                "                        </div>\n" +
                "                        <div class=\"form-group\">\n" +
                "                            <label for=\"quantity\"><Strong>Ngày đăng bán</Strong></label>\n" +
                "                            <input type=\"text\" value=\""+p.getSaleDate()+"\" name=\"productQuantity\" class=\"form-control\" id=\"quantity\" placeholder=\"Enter product quantity\">\n" +
                "<span class=\"form-message\"></span>"+
                "                        </div>"

        );
    }
}
