package com.example.tmdt.controller.user_controller;

import com.example.tmdt.beans.Cart;
import com.example.tmdt.beans.Category;
import com.example.tmdt.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        List<Category> listC = CategoryService.getInstance().getAllCategory();

        if(cart == null) {
            cart = Cart.getInstance();
        }

        request.setAttribute("listC",listC);

        session.setAttribute("cart", cart);
        request.getRequestDispatcher("cart.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
