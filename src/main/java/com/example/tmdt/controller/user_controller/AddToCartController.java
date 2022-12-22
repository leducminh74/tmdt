package com.example.tmdt.controller.user_controller;

import com.example.tmdt.beans.Cart;
import com.example.tmdt.beans.Product;
import com.example.tmdt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddToCartController", value = "/add")
public class AddToCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart == null){
            cart = Cart.getInstance();
        }

        Product p = ProductService.getInstance().getProductById(id);
        cart.put(p);
        session.setAttribute("cart", cart);

        PrintWriter out = response.getWriter();
        int pid = Integer.parseInt(id);
        int quantitySold = cart.get(pid).getQuantitySold();
        out.println(quantitySold);
    }
}
