package com.example.tmdt.filter;

import com.example.tmdt.beans.Account;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "CheckAdmin", urlPatterns = "/admin/*")
public class CheckAdmin implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        HttpSession session = httpServletRequest.getSession();
        String loginURI = httpServletRequest.getContextPath() + "/login";
        String homeURI = httpServletRequest.getContextPath() + "/index";

        Account a = (Account) session.getAttribute("acc");

        boolean loggedIn = session != null && session.getAttribute("acc") != null;
        boolean loginRequest = httpServletRequest.getRequestURI().equals(loginURI);

        if(loggedIn || loginRequest){
            if(a.getRole() == 1 || a.getRole() == 2){
                chain.doFilter(request, response);
            }else{
                httpServletResponse.sendRedirect(homeURI);
            }
        } else{
            String redirectURL = httpServletRequest.getContextPath() + httpServletRequest.getServletPath();
            session.setAttribute("redirectURL", redirectURL);
            httpServletResponse.sendRedirect(loginURI);
        }


    }
}
