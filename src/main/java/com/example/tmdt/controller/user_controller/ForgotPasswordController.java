package com.example.tmdt.controller.user_controller;

import com.example.tmdt.beans.Account;
import com.example.tmdt.mail.Mail;
import com.example.tmdt.random.RandomPassword;
import com.example.tmdt.service.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ForgotPasswordController", value = "/forgotpassword")
public class ForgotPasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("forgotpassword.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        {
            String username = request.getParameter("username");
            String email = request.getParameter("email");

            Account a = AccountService.getInstance().checkUserExist(username);
            String subject = "Forgot Password";


            if(a!=null && a.getEmail().equals(email)){
                String newPass = RandomPassword.randomAlphaNumeric();
                AccountService.getInstance().changePassword(a,newPass);
                String content = "Your password is " + newPass;
                Mail.sendMail(email,subject,content);
                request.setAttribute("message", "Your password has been sent. Please check in your email");
                request.setAttribute("success","success");
                request.getRequestDispatcher("forgotpassword.jsp").forward(request,response);
            }else{
                request.setAttribute("message", "Username and email do not match. Please check again");
                request.setAttribute("success","");
                request.getRequestDispatcher("forgotpassword.jsp").forward(request,response);
            }

        }
    }
}
