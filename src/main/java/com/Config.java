package com;

import com.dao.AdminDAO;
import com.dao.NewsDAO;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.model.News;
import org.json.JSONArray;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.StringWriter;
import java.util.List;

public class Config implements ServletContextListener{

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        servletContextEvent.getServletContext().setAttribute("admin", new AdminDAO());
        servletContextEvent.getServletContext().setAttribute("news", new NewsDAO());
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        /*List<News> newsList = ((NewsDAO) servletContextEvent.getServletContext().getAttribute("news")).newsList;
        ObjectMapper mapper = new ObjectMapper();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        JSONArray news = new JSONArray();
        for(News item : newsList){
            try {
                news.put(mapper.writeValueAsString(item));
            } catch (Exception e){
                e.printStackTrace();
            }
        }

        try{
            FileWriter writer = new FileWriter(servletContextEvent.getServletContext().getInitParameter("upload_path") + "/../news.json", false);
//            FileOutputStream outputStream = new FileOutputStream(this.getClass().getClassLoader().getResource("news.json").getFile(), false);
//            byte[] strToBytes = .getBytes();
//            outputStream.write(strToBytes);
//            outputStream.close();
            news.write(writer);
            writer.close();
        } catch (Exception e){
            e.printStackTrace();
        }*/
    }
}
