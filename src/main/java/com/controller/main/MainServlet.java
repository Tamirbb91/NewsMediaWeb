package com.controller.main;

import com.dao.NewsDAO;
import com.model.News;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<News> news = ((NewsDAO) this.getServletContext().getAttribute("news")).newsList;
        List<News> filteredNews = new ArrayList<>();
        for(int i=news.size()-1;i>=news.size()-1-(news.size()/3);i--){
            filteredNews.add(news.get(i));
        }

        req.setAttribute("news", filteredNews);
        RequestDispatcher dispatcher = req.getRequestDispatcher("static/main/index.jsp");
        dispatcher.forward(req, resp);
    }
}
