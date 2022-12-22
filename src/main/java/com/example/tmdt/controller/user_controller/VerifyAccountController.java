package com.example.tmdt.controller.user_controller;

import com.example.tmdt.beans.Account;
import com.example.tmdt.dao.AccountDao;
import com.example.tmdt.service.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "VerifyAccountController", value = "/VerifyAccountController")
public class VerifyAccountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {{
        HttpSession session = request.getSession();
        String email = request.getParameter("key1");
        String hashPass = request.getParameter("key2");

        Account a =  AccountService.getInstance().activeAccount(email,hashPass);
        session.setAttribute("closeTab","closeTab");
        if(a!= null){
            int a1 = AccountDao.getInstance().getIDLast().getUserId();
            System.out.println(a1);
            if (a1 != 0) {
                AccountDao.getInstance().add_user(a1);
                System.out.println("add");
            }
            request.setAttribute("message","Your account has been activated!");
            request.setAttribute("user", a.getUsername());
            request.setAttribute("success","success");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }else{
            request.setAttribute("message","Account activation failed!");
            request.setAttribute("success","");
            request.getRequestDispatcher("register.jsp").forward(request,response);
        }

    }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
