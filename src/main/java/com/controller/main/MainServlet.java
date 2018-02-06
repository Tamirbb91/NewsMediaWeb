package com.controller.main;

import com.dao.NewsDAO;
import com.model.News;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<News> newsList = ((NewsDAO) this.getServletContext().getAttribute("newsList")).newsList;
        req.setAttribute("newsList", newsList);
        RequestDispatcher dispatcher = req.getRequestDispatcher("static/main/index.jsp");
        dispatcher.forward(req, resp);
    }
}
