package com.example.tmdt.controller.user_controller;

import com.example.tmdt.beans.Category;
import com.example.tmdt.beans.Product;
import com.example.tmdt.dao.ProductDao;
import com.example.tmdt.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShopController", value = "/shop")
public class ShopController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String seperate = "and";
        String cId = request.getParameter("cId");
        String filterId = request.getParameter("filterByPrice");
        String colorId = request.getParameter("filterByColor");
        if(filterId == null){
            filterId = "0";
        }
        if(colorId == null){
            colorId = "0";
        }
        int filterCode = Integer.parseInt(filterId);
        int colorCode = Integer.parseInt(colorId);
        if(cId == null){
            cId = "7";
        }
        String sort = request.getParameter("sort");
        if(sort == null){
            sort = "0";
        }
        int sortCode = Integer.parseInt(sort);
        int sortByCode = -1;
        int conditionCode = -1;
        switch (sortCode){
            case 0:
                sortByCode = 0;
                conditionCode = 1;
                break;
            case 1:
                sortByCode = 1;
                conditionCode = 0;
                break;
            case 2:
                sortByCode = 1;
                conditionCode = 1;
                break;
            case 3:
                sortByCode = 2;
                conditionCode = 1;
                break;
            case 4:
                sortByCode = 2;
                conditionCode = 0;
                break;
        }

        String indexString = request.getParameter("page");
        if(indexString == null){
            indexString = "1";
        }
        int page = Integer.parseInt(indexString);
        int count = ProductDao.getInstance().getTotalByCategory(cId,filterCode,colorCode);
        String size = request.getParameter("sizepage");
        if(size == null){
            size = "9";
        }
        int pageSize = Integer.parseInt(size);
        int endPage = count/pageSize;
        if(count % pageSize != 0){
            endPage++;
        }

        List<Product> listPByC = CategoryService.getInstance().getProductByCID(cId,page,pageSize,sortByCode,conditionCode,filterCode ,seperate,colorCode);
        List<Category> listC = CategoryService.getInstance().getAllCategory();
        Category c = CategoryService.getInstance().getCategoryByCId(cId);

        request.setAttribute("listPByC", listPByC);
        request.setAttribute("listC", listC);
        request.setAttribute("size", size);
        request.setAttribute("cName", c.getcName());
        request.setAttribute("sortCode", sort);
        request.setAttribute("numberOfProduct", count);
        request.setAttribute("filterCode", filterCode);
        request.setAttribute("filterColorCode", colorCode);
        request.setAttribute("end", endPage);
        request.setAttribute("tag", page);
        request.setAttribute("cId", Integer.parseInt(cId));

        request.getRequestDispatcher("shop.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
