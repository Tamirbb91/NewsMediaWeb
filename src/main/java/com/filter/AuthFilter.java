package com.filter;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        if(req.getRequestURI().equals("/static/admin/jsp/login.jsp")){
           filterChain.doFilter(servletRequest, servletResponse);
           return;
        }

        if(req.getSession().getAttribute("admin") != null){
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }

        resp.sendRedirect("/static/admin/jsp/login.jsp");
    }

    @Override
    public void destroy() {

    }
}
