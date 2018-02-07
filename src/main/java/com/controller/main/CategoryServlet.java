package com.controller.main;

import com.dao.NewsDAO;
import com.model.Category;
import com.model.News;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CategoryServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cat = req.getParameter("type");
        if(cat!=null){
            List<News> news = ((NewsDAO) this.getServletContext().getAttribute("news")).newsList;
            List<News> filteredNews = new ArrayList<>();
            for(News perNews : news){
                if(perNews.getCategory().toString().equals(cat)){
                    filteredNews.add(perNews);
                }
            }
            req.setAttribute("category",cat);
            req.setAttribute("news",filteredNews);
            RequestDispatcher dispatcher = req.getRequestDispatcher("static/main/index.jsp");
            dispatcher.forward(req, resp);
        }else{
            resp.sendRedirect("/main");
        }

    }
}
