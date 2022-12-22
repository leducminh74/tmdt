package com.example.tmdt.controller.user_controller;

import com.example.tmdt.beans.Account;
import com.example.tmdt.service.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ChangePasswordController", value = "/changepassword")
public class ChangePasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("changepassword.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        {
            try {
                HttpSession session = request.getSession();
                String currentPass = request.getParameter("Current_password");
                String newPass = request.getParameter("New_password");

                Account a  = (Account) session.getAttribute("acc");
                boolean checkSuccess = AccountService.getInstance().checkPasswordCorrect(a,currentPass);
                if(checkSuccess){
                    AccountService.getInstance().changePassword(a,newPass);
                    request.setAttribute("message","Change password success!");
                    request.setAttribute("success","success");
                    request.getRequestDispatcher("changepassword.jsp").forward(request,response);
                }else{
                    request.setAttribute("message","Current Password is incorrect!");
                    request.setAttribute("success","");
                    request.getRequestDispatcher("changepassword.jsp").forward(request,response);
                }

            }catch (Exception e){

            }

        }
    }
}
