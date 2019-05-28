package com.zking.redis;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class RedisTemplateUtil {

    @Resource
    private RedisTemplate<String, Object> redisTemplate;

    /**
     * 操作String类型的set和get方法
     */
    public void setString(String key, Object value){
        redisTemplate.opsForValue().set(key, value);
//        redisTemplate.expire(key, 60, TimeUnit.SECONDS);
    }
    public Object getString(String key){
        return redisTemplate.opsForValue().get(key);
    }

}
