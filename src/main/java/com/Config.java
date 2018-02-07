package com;

import com.dao.AdminDAO;
import com.dao.NewsDAO;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.File;

public class Config implements ServletContextListener{

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        servletContextEvent.getServletContext().setAttribute("admin", new AdminDAO());
        servletContextEvent.getServletContext().setAttribute("news", new NewsDAO());
        servletContextEvent.getServletContext().setAttribute("upload_path", "C:/Users/Tamir/IdeaProjects/NewsMediaWeb/out/artifacts/NewsMediaWeb_Web_exploded/WEB-INF/classes/images/");
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
