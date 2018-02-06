package com.controller.admin;

import com.dao.AdminDAO;
import com.dao.NewsDAO;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
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
import java.util.List;

public class NewsController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin == null){

        }
        try{
            List<News> myPost = new ArrayList<>();
            List<News> newsList = ((NewsDAO) this.getServletContext().getAttribute("news")).newsList;
            for(News item : newsList){
                if(item.getAdmin().getEmail().equals(admin.getEmail())){
                    myPost.add(item);
                }
            }
            session.setAttribute("myPost", myPost);
            req.getRequestDispatcher("/static/admin/jsp/home.jsp").forward(req, resp);
            return;
        } catch(Exception e){
            e.printStackTrace();
        }

        req.getRequestDispatcher("/static/admin/jsp/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();

        if(session.getAttribute("admin") == null){
            out.print("{\"result\": \"failed\",\"message\": \"You have no access.\"}");
            return;
        }

        try{
            Admin admin = (Admin) session.getAttribute("admin");
            ObjectMapper mapper = new ObjectMapper();
            mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
            String newPost = req.getParameter("news");

            TypeReference<News> mapType = new TypeReference<News>() {};
            News news  = mapper.readValue(newPost, mapType);
            news.setAdmin(admin);
            NewsDAO s = ((NewsDAO) this.getServletContext().getAttribute("news"));
            s.addNews(news);
            this.getServletContext().setAttribute("news", s);
            out.print("{\"result\": \"success\",\"message\": \"News is published successfully.\"}");
            return;
        } catch(Exception e){
            e.printStackTrace();
        }

        out.print("{\"result\": \"failed\",\"message\": \"Failed.\"}");
    }
}
