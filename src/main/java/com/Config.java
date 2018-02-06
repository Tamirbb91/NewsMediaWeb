package com;

import com.dao.AdminDAO;
import com.dao.NewsDAO;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class Config implements ServletContextListener{

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        servletContextEvent.getServletContext().setAttribute("admin", new AdminDAO());
        servletContextEvent.getServletContext().setAttribute("newsList", new NewsDAO());
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
