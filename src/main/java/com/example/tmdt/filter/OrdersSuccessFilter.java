package com.example.tmdt.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "OrdersSuccessFilter",urlPatterns = "/ordersuccess/*")
public class OrdersSuccessFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        HttpSession session = httpServletRequest.getSession();

        String referer = httpServletRequest.getHeader("referer");
        if(referer == null || !referer.endsWith("checkout")){
            httpServletResponse.sendRedirect("order");
        }else{
            chain.doFilter(request,response);

        }
    }
}
