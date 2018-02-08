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

public class ReadmoreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] newids = req.getParameterValues("newsids[]");
//        for(String n:newids){
//            System.out.println(n);
//        }
        String category = req.getParameter("category");
        String emotion = req.getParameter("emotion");
        List<News> news = ((NewsDAO) this.getServletContext().getAttribute("news")).newsList;
        List<News> copyNews = new ArrayList<>(news);

        for(String newid:newids){
            for(int i=copyNews.size()-1;i>=0;i--){
                if(copyNews.get(i).getId().equals(newid)){
                    copyNews.remove(i);
                    break;
                }
            }
        }
        if(category!=""){
            for(int i=copyNews.size()-1;i>=0;i--){
                if(!copyNews.get(i).getCategory().toString().equals(category)){
                    copyNews.remove(i);
                }
            }
        }
        if(emotion!=""){
            int emotionid = Integer.parseInt(emotion);
            if (emotionid >= 1 && emotionid <= 5) {
                for(int i=copyNews.size()-1;i>=0;i--){
                    Map.Entry<Integer, Integer> maxEntry = null;

                    for (Map.Entry<Integer, Integer> entry : news.get(i).getEmotionPoints().entrySet()) {
                        if (maxEntry == null || entry.getValue().compareTo(maxEntry.getValue()) > 0) {
                            maxEntry = entry;
                        }
                    }
                    if (maxEntry.getKey() != emotionid) {
                        copyNews.remove(i);
                    }
                }
            }

        }
        if(copyNews.size()>0){
            int i= copyNews.size()>2 ? 2 : copyNews.size();
            List<News> lastNews = new ArrayList<>();
            for(int j=copyNews.size()-1;j>=0;j--){
                if(i==0)
                    break;
                else{
                    lastNews.add(copyNews.get(j));
                    i--;
                }
            }
            req.setAttribute("morenews", lastNews);
            RequestDispatcher dispatcher = req.getRequestDispatcher("static/main/morenews.jsp");
            dispatcher.forward(req, resp);
        }else{
            resp.getWriter().print("nothing new");
        }

    }
}
