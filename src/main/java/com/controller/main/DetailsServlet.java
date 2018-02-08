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
import java.util.Collections;
import java.util.List;

public class DetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String newsid = req.getParameter("newsid");
        if (newsid != null) {
            List<News> news = ((NewsDAO) this.getServletContext().getAttribute("news")).newsList;
            News foundNews = null;
            for (News perNews : news) {
                if (perNews.getId().equals(newsid)) {
                    foundNews = perNews;
                    break;
                }
            }
            if (foundNews != null) {
                foundNews.incrementViewCount();


                ArrayList<Integer> list = new ArrayList<Integer>();
                for (int i=1; i<news.size(); i++) {
                    if(i!=news.indexOf(foundNews)){
                        list.add(new Integer(i));
                    }
                }
                Collections.shuffle(list);
                News nextNew = news.get(list.get(0));
                List<News> recommendedNews = new ArrayList<>();
                for (int i=1; i<4; i++) {
                    recommendedNews.add(news.get(list.get(i)));
                }

                req.setAttribute("cnew", foundNews);
                req.setAttribute("nextNew", nextNew);
                req.setAttribute("recommendedNews", recommendedNews);
                RequestDispatcher dispatcher = req.getRequestDispatcher("static/main/details.jsp");
                dispatcher.forward(req, resp);
            } else {
                resp.sendRedirect("/main");
            }
        } else {
            resp.sendRedirect("/main");
        }

    }
}
