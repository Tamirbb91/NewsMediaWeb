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
import java.util.Map;

public class CategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cat = req.getParameter("type");
        String emotion = req.getParameter("emotion");
        int counter = 2;
        if (cat != null) {
            List<News> news = ((NewsDAO) this.getServletContext().getAttribute("news")).newsList;
            List<News> filteredNews = new ArrayList<>();
            for (int i = news.size() - 1; i >= 0; i--) {
                if (news.get(i).getCategory().toString().equals(cat)) {
                    if (counter != 0) {
                        filteredNews.add(news.get(i));
                        counter--;
                    } else {
                        break;
                    }
                }
            }
            req.setAttribute("category", cat);
            req.setAttribute("news", filteredNews);
            RequestDispatcher dispatcher = req.getRequestDispatcher("static/main/index.jsp");
            dispatcher.forward(req, resp);
        } else if (emotion != null) {
            int emotionid = Integer.parseInt(emotion);
            if (emotionid >= 1 && emotionid <= 5) {
                List<News> news = ((NewsDAO) this.getServletContext().getAttribute("news")).newsList;
                List<News> filteredNews = new ArrayList<>();
                for (int i = news.size() - 1; i >= 0; i--) {
                    Map.Entry<Integer, Integer> maxEntry = null;

                    for (Map.Entry<Integer, Integer> entry : news.get(i).getEmotionPoints().entrySet()) {
                        if (maxEntry == null || entry.getValue().compareTo(maxEntry.getValue()) > 0) {
                            maxEntry = entry;
                        }
                    }
                    if (maxEntry.getKey() == emotionid) {
                        if (counter != 0) {
                            filteredNews.add(news.get(i));
                            counter--;
                        } else {
                            break;
                        }
                    }
                }
                req.setAttribute("emotion", emotionid);
                req.setAttribute("news", filteredNews);
                RequestDispatcher dispatcher = req.getRequestDispatcher("static/main/index.jsp");
                dispatcher.forward(req, resp);
            } else {
                resp.sendRedirect("/main");
            }

        } else {
            resp.sendRedirect("/main");
        }

    }
}
