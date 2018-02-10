package com.dao;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationConfig;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.model.News;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class NewsDAO {
    public List<News> newsList = new ArrayList<>();

    public NewsDAO(){
        init();
    }

    public void init(){
        ObjectMapper mapper = new ObjectMapper();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
//        mapper.configure(DeserializationFeature.ACCEPT_EMPTY_ARRAY_AS_NULL_OBJECT, true);

        try {
            TypeReference<List<News>> mapType = new TypeReference<List<News>>() {};
            newsList = mapper.readValue(this.getClass().getClassLoader().getResource("news.json"), mapType);
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public void addNews(News item){
        item.setId(generateId());
        item.setPublishedDate(new Date());
        newsList.add(item);
    }

    public void remove(String Id){
        for(News item : newsList){
            if(item.getId().equals(Id)){
                newsList.remove(item);
                return;
            }
        }
    }

    public void changeNews(String Id, News changedItem){
        for(News item : newsList){
            if(item.getId().equals(Id)){
                newsList.remove(item);
                newsList.add(changedItem);
                return;
            }
        }
    }

    public String generateId(){
       return ((Long) System.currentTimeMillis()).toString();
    }

//    public static void main(String[] args){
//        System.out.println(NewsDAO.newsList.size());
//    }
}
