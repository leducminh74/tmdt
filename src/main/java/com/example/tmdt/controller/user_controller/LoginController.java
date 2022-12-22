package com.example.tmdt.controller.user_controller;

import com.example.tmdt.beans.Account;
import com.example.tmdt.service.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            Cookie arr[] = request.getCookies();

            if(arr != null){
                for(Cookie c : arr){
                    if(c.getName().equals("userC")){
                        request.setAttribute("user", c.getValue());
                    }
                    if(c.getName().equals("passC")){
                        request.setAttribute("pass", c.getValue());
                    }
                }
            }

            request.getRequestDispatcher("login.jsp").forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        {
            HttpSession session = request.getSession();
            String username = request.getParameter("Username");
            String password = request.getParameter("Password");
            String remember = request.getParameter("remember");

            Account a = AccountService.getInstance().login(username,password);
            if(a == null){
                request.setAttribute("user", username);
                request.setAttribute("success", "");
                request.setAttribute("message","Username or Password is incorrect");
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }else if(a.getStatus() == 1){
                session.setAttribute("acc", a);
                Cookie u = new Cookie("userC", username);
                Cookie p = new Cookie("passC", password);
                u.setMaxAge(60);

                if(remember != null){
                    p.setMaxAge(60);
                }else{
                    p.setMaxAge(0);
                }
                response.addCookie(u);
                response.addCookie(p);

                if(a.getRole() == 1){
                    response.sendRedirect("/tmdt_war_exploded/admin");
                }else if(a.getRole() == 2) {
                    response.sendRedirect("index");
                }else{
                    if(session.getAttribute("redirectURL") == null){
                        response.sendRedirect("index");
                    }else{
                        String redirectURL = (String) session.getAttribute("redirectURL");
                        response.sendRedirect(redirectURL);
                        session.removeAttribute("redirectURL");
                    }
                }

            }else if(a.getStatus() == 2){
                request.setAttribute("success", "");
                request.setAttribute("message","Your account has been disabled. Please contact the store directly for support!!");
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }else{
                request.setAttribute("user", username);
                request.setAttribute("success", "");

                request.setAttribute("message","Your account has not been activated. Please check your email and active account");
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }
        }
    }
}
