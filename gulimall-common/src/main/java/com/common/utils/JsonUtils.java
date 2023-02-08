package com.common.utils;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;


public class JsonUtils {
    private static ObjectMapper objectMapper = new ObjectMapper();

    static {
        objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
    }
    /**
     * List<T> to json String
     */

    public static <T> String listToJson(List<T> ts) {
        return JSON.toJSONString(ts);
    }

    public static HashMap<String, Object> objectToMap(Object obj) {
        if (obj == null) {
            return null;
        }
        HashMap<String, Object> map = new HashMap<String, Object>();
        try {
            Field[] declaredFields = obj.getClass().getDeclaredFields();
            for (Field field : declaredFields) {
                field.setAccessible(true);
                map.put(field.getName(), field.get(obj));
            }
        } catch (Exception e) {

        }

        return map;
    }

    /**
     * Obj to Json
     */
    public static String objectToJson(Object data) {
        try {
            String string = objectMapper.writeValueAsString(data);
            return string;
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Json to Obj
     */
    public static <T> T jsonToPojo(String jsonData, Class<T> beanType) {
        try {
            T t = objectMapper.readValue(jsonData, beanType);
            return t;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }



    /**
     * Json to Pojo list
     */
    public static <T>List<T> jsonToList(String jsonData, Class<T> beanType) {
        JavaType javaType = objectMapper.getTypeFactory().constructParametricType(List.class, beanType);
        try {
            List<T> list = objectMapper.readValue(jsonData, javaType);
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    public static <T> T mapper(JsonNode node , Class<T> valueType) throws Exception{
        if (node == null||node.size()==0)
            return null;
        try {
            return objectMapper.readValue(objectMapper.writeValueAsString(node), valueType);
        } catch (Exception e) {
            throw e;
        }
    }

}