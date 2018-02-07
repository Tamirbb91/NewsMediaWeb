package com.controller.admin;

import com.dao.NewsDAO;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.model.Admin;
import com.model.News;
import com.model.Section;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class UpdateNewsController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();

        if(session.getAttribute("admin") == null){
            out.print("{\"result\": \"failed\",\"message\": \"You have no access.\"}");
            return;
        }

        try{
            String newsId = req.getParameter("newsId");
            if(newsId != null) {
                NewsDAO s = ((NewsDAO) this.getServletContext().getAttribute("news"));
                s.remove(newsId);
                this.getServletContext().setAttribute("news", s);
                out.print("{\"result\": \"success\",\"message\": \"News is deleted successfully.\"}");
                return;
            }
        } catch(Exception e){
            e.printStackTrace();
        }

        out.print("{\"result\": \"failed\",\"message\": \"Failed.\"}");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();

        if(session.getAttribute("admin") == null){
            out.print("{\"result\": \"failed\",\"message\": \"You have no access.\"}");
            return;
        }

        try{
            Admin admin = (Admin) session.getAttribute("admin");
            ObjectMapper mapper = new ObjectMapper();
            mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
            String editPost = req.getParameter("news");

            TypeReference<News> mapType = new TypeReference<News>() {};
            News news  = mapper.readValue(editPost, mapType);
            news.setAdmin(admin);
            NewsDAO s = ((NewsDAO) this.getServletContext().getAttribute("news"));
            for(int i=0; i < s.newsList.size(); i++){
                if(s.newsList.get(i).getId().equals(news.getId())){
                    News temp = s.newsList.get(i);
                    news.setCoverImage(temp.getCoverImage());
                    List<Section> sections = news.getSections();
                    for(int j=0; j< sections.size(); j++){
                        temp.getSections().get(j).setTitle(sections.get(j).getTitle());
                        temp.getSections().get(j).setParagraph(sections.get(j).getParagraph());
                    }
                    news.setSections(temp.getSections());
                    s.newsList.set(i, news);
                    break;
                }
            }
            this.getServletContext().setAttribute("news", s);
            out.print("{\"result\": \"success\",\"message\": \"News is updated successfully.\"}");
            return;
        } catch(Exception e){
            e.printStackTrace();
        }

        out.print("{\"result\": \"failed\",\"message\": \"Failed.\"}");
    }
}
