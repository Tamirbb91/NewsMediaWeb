package com.dao;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.model.Admin;

import java.io.File;
import java.util.HashMap;

public class AdminDAO {
    public HashMap<String, Admin> adminList = new HashMap<>();

    public AdminDAO(){
        init();
    }

    public void init(){
        ObjectMapper mapper = new ObjectMapper();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(JsonParser.Feature.ALLOW_COMMENTS, true);
        try {
            TypeReference<HashMap<String, Admin>> mapType = new TypeReference<HashMap<String, Admin>>() {};
            adminList = mapper.readValue(this.getClass().getClassLoader().getResource("admin.json"), mapType);
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public Boolean addAdmin(Admin item){
        if(!adminList.containsKey(item.getEmail())){
            adminList.put(item.getEmail(), item);
            return true;
        }
        return false;
    }
}
