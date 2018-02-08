package com.controller.admin;

import com.dao.AdminDAO;
import com.dao.NewsDAO;
import com.model.Admin;
import com.model.News;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class LoginController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setMaxInactiveInterval(-1);
        session.invalidate();
        resp.sendRedirect("/static/admin/jsp/login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        try{
            String username = req.getParameter("email");
            String password = req.getParameter("password");

            HashMap<String, Admin> list = ((AdminDAO) this.getServletContext().getAttribute("admin")).adminList;

            if(list.get(username).getPassword().equals(password)){
                out.print("{\"result\": \"success\"}");
                HttpSession session = req.getSession();
                session.setAttribute("admin", list.get(username));
                List<News> myPost = new ArrayList<>();
                List<News> newsList = ((NewsDAO) this.getServletContext().getAttribute("news")).newsList;
                for(News item : newsList){
                    if(item.getAdmin().getEmail().equals(username)){
                        myPost.add(item);
                    }
                }
                session.setAttribute("myPost", myPost);
                return;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        out.print("{\"result\": \"failed\",\"message\": \"Username or Password is invalid!\"}");
    }
}
