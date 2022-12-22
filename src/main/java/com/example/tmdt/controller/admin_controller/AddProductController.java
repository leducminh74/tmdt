package com.example.tmdt.controller.admin_controller;

import com.example.tmdt.beans.Account;
import com.example.tmdt.service.AdminService;
import com.example.tmdt.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;

@WebServlet(name = "AddProductController", value = "/admin/addProduct")
@MultipartConfig
public class AddProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        Account a   = (Account) session.getAttribute("acc");
        int sid = a.getUserId();
        String name = request.getParameter("productName");
        String color = request.getParameter("productColor");
        String brandId = request.getParameter("productBrand");
        String brand = "";
        if(!brandId.equals("7")){
            brand = CategoryService.getInstance().getCategoryByCId(brandId).getcName();
        }else{
            brand = request.getParameter("otherBrand");
        }
        String description = request.getParameter("productDescription");
        String salientFeatures = request.getParameter("productSalientFeatures");
        String price = request.getParameter("productPrice");
        String sellPrice = request.getParameter("productSellPrice");
        String quantity = request.getParameter("productQuantity");

        Part part = request.getPart("productImage");
        String fileName = extractFileName(part);
        fileName = new File(fileName).getName();
        String savePath =  request.getServletContext().getRealPath("/img");

        File fileSaveDir = new File(savePath);
        if(!fileSaveDir.exists()){
            fileSaveDir.mkdirs();
        }
        part.write(savePath+ File.separator + fileName);

        AdminService.getInstance().addProduct(sid,name,color,brand,description,salientFeatures,price,sellPrice,fileName,quantity,brandId);
        response.sendRedirect("/tmdt_war_exploded/admin/product-management");
    }
    private String extractFileName(Part part){
        String content = part.getHeader("content-disposition");
        String [] items = content.split(";");
        for (String s : items){
            if(s.trim().startsWith("filename")){
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
