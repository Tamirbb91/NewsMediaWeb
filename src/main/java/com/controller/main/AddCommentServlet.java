package com.controller.main;

import com.dao.NewsDAO;
import com.model.Comment;
import com.model.News;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

public class AddCommentServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("username");
        String comment = req.getParameter("comment");
        Date date = new Date();
        String newsid = req.getParameter("newsid");
        List<News> news = ((NewsDAO) this.getServletContext().getAttribute("news")).newsList;
        News foundNews = null;
        for (News perNews : news) {
            if (perNews.getId().equals(newsid)) {
                foundNews = perNews;
                break;
            }
        }
        if(foundNews!=null){
            foundNews.addComment(new Comment(userName,comment,date));
            PrintWriter out = resp.getWriter();
            out.write("Success!");
        }else{
            resp.sendRedirect("/main");
        }
    }
}
