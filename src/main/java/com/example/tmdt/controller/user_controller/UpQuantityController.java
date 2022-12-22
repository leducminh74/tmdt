package com.example.tmdt.controller.user_controller;

import com.example.tmdt.beans.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpQuantityController", value = "/upQuantity")
public class UpQuantityController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        String pid = request.getParameter("id");
        int id = Integer.parseInt(pid);
        cart.upQuantity(id);

        double total = cart.total();
        PrintWriter out = response.getWriter();
        out.println(total);
    }
}
