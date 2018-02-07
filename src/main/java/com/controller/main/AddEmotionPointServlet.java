package com.controller.main;

import com.dao.NewsDAO;
import com.model.News;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class AddEmotionPointServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer emotion = Integer.parseInt(req.getParameter("emotion"));
        String newsid = req.getParameter("newsid");
        List<News> news = ((NewsDAO) this.getServletContext().getAttribute("news")).newsList;
        News foundNews = null;
        for (News perNews : news) {
            if (perNews.getId().equals(newsid)) {
                foundNews = perNews;
                break;
            }
        }
        PrintWriter out = resp.getWriter();
        if (foundNews != null) {
            foundNews.getEmotionPoints().put(emotion, foundNews.getEmotionPoints().get(emotion) + 1);
            out.write(emotion);
        } else {
            out.write("error");
        }
    }
}
