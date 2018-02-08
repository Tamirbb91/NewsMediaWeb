package com.controller.main;

import com.dao.NewsDAO;
import com.model.Admin;
import com.model.News;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class AuthorsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        Admin admin = null;
        if (email != null) {
            List<News> news = ((NewsDAO) this.getServletContext().getAttribute("news")).newsList;
            List<News> filteredNews = new ArrayList<>();
            for (int i = news.size() - 1; i >= 0; i--) {
                if (news.get(i).getAdmin().getEmail().equals(email)) {
                    filteredNews.add(news.get(i));
                }
            }
            if (filteredNews.size() > 0) {
                admin = filteredNews.get(0).getAdmin();
                req.setAttribute("admin", admin);
                req.setAttribute("news", filteredNews);
                req.getRequestDispatcher("/static/main/authors.jsp").forward(req, resp);
            } else {
                resp.sendRedirect("/main");
            }
        } else {
            resp.sendRedirect("/main");
        }
    }
}
