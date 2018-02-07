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

public class ReadmoreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] newids = req.getParameterValues("newsids[]");
//        for(String n:newids){
//            System.out.println(n);
//        }
        String category = req.getParameter("category");
        List<News> news = ((NewsDAO) this.getServletContext().getAttribute("news")).newsList;
        List<News> copyNews = new ArrayList<>(news);

        for(String newid:newids){
            for(int i=0;i<copyNews.size();i++){
                if(copyNews.get(i).getId().equals(newid)){
                    copyNews.remove(i);
                    break;
                }
            }
        }
        if(category!=""){
            for(int i=0;i<copyNews.size();i++){
                if(!copyNews.get(i).getCategory().toString().equals(category)){
                    copyNews.remove(i);
                }
            }
        }
        if(copyNews.size()>0){
            req.setAttribute("morenews", copyNews);
            RequestDispatcher dispatcher = req.getRequestDispatcher("static/main/morenews.jsp");
            dispatcher.forward(req, resp);
        }else{
            resp.getWriter().print("nothing new");
        }

    }
}
