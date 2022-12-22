package com.example.tmdt.controller.user_controller;

import com.example.tmdt.beans.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DownQuantityController", value = "/downQuantity")
public class DownQuantityController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        String pid = request.getParameter("id");
        int id = Integer.parseInt(pid);
        cart.downQuantity(id);
        if(cart.get(id).getQuantitySold() <= 0){
            cart.remove(id);
        }

        double total = cart.total();
        PrintWriter out = response.getWriter();
        if(cart.getData().size() == 0){
            out.println(" <h2 class=\"text-center m-8 \"><strong>Giỏ hàng của bạn đang trống</strong></h2>\n" +
                    "            <button style=\"display: block; margin: 0 auto\" type=\"button\" class=\"btn btn-lg btn-primary mt-2\" onclick=\"location.href ='index' \">Đặt hàng ngay</button>");
        }else{
            out.println(total);

        }
    }
}
