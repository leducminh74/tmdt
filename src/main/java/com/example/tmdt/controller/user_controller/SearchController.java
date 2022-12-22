package com.example.tmdt.controller.user_controller;

import com.example.tmdt.beans.Category;
import com.example.tmdt.beans.Product;
import com.example.tmdt.dao.ProductDao;
import com.example.tmdt.service.CategoryService;
import com.example.tmdt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchController", value = "/search")
public class SearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String search = request.getParameter("search");
        if(search == null){
            search = "";
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
        int count = ProductDao.getInstance().getTotalBySearch(search);
        String size = request.getParameter("sizepage");
        if(size == null){
            size = "9";
        }
        int pageSize = Integer.parseInt(size);
        int endPage = count/pageSize;
        if(count % pageSize != 0){
            endPage++;
        }
        List<Product> list = ProductService.getInstance().searchByName(search.trim(),page,pageSize,sortByCode,conditionCode);
        List<Category> listC = CategoryService.getInstance().getAllCategory();

        request.setAttribute("size", size);
        request.setAttribute("sortCode", sort);
        request.setAttribute("listPBS", list);
        request.setAttribute("result", search);
        request.setAttribute("end", endPage);
        request.setAttribute("tag", page);
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("search.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
