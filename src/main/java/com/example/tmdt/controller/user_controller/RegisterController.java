package com.example.tmdt.controller.user_controller;

import com.example.tmdt.beans.Account;
import com.example.tmdt.dao.AccountDao;
import com.example.tmdt.mail.Mail;
import com.example.tmdt.service.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RegisterController", value = "/register")
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        {
            HttpSession session = request.getSession();
            try {
                String user = request.getParameter("Username");
                String pass = request.getParameter("Password");
                String email = request.getParameter("Email");
                String phoneNumber = request.getParameter("PhoneNumber");

                String subject = "Account verification";

                Account checkUser = AccountService.getInstance().checkUserExist(user);
                Account checkEmail = AccountService.getInstance().checkEmailExist(email);
                if(checkUser != null){
                    request.setAttribute("user", user);
                    request.setAttribute("email", email);
                    request.setAttribute("phone", phoneNumber);
                    request.setAttribute("success", "");
                    request.setAttribute("message", "Username already exists");
                    request.getRequestDispatcher("register.jsp").forward(request,response);

                }else if(checkEmail != null) {
                    request.setAttribute("user", user);
                    request.setAttribute("email", email);
                    request.setAttribute("phone", phoneNumber);
                    request.setAttribute("success", "");
                    request.setAttribute("message", "Email already exists");
                    request.getRequestDispatcher("register.jsp").forward(request, response);

                }else{
                    AccountService.getInstance().register(user,pass,email,phoneNumber);
                    String hashPass = AccountDao.getInstance().hashPassword(pass);
                    String content = "Click here: " + " http://localhost:8080/tmdt_war_exploded/VerifyAccountController?key1=" + email + "&key2=" + hashPass + "  to verify your account";
                    Mail.sendMail(email,subject,content);
                    request.setAttribute("success", "success");
                    request.setAttribute("message", "An account verification email has been sent to you. Please check your email and verify your account.");
                    request.getRequestDispatcher("register.jsp").forward(request,response);


                }
            }catch (Exception e){

            }

        }
    }
}
