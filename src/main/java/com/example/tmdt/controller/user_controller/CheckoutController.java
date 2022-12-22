package com.example.tmdt.controller.user_controller;

import com.example.tmdt.beans.Account;
import com.example.tmdt.beans.Cart;
import com.example.tmdt.beans.Category;
import com.example.tmdt.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CheckoutController", value = "/checkout")
public class CheckoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        Account acc = (Account) session.getAttribute("acc");
        String email = "";
        if(acc != null){
            email = acc.getEmail();
        }
        if(cart == null) {
            cart = Cart.getInstance();
        }
        List<Category> listC = CategoryService.getInstance().getAllCategory();

        request.setAttribute("listC",listC);
        session.setAttribute("cart", cart);
        session.setAttribute("email",email);
        request.getRequestDispatcher("checkout.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
