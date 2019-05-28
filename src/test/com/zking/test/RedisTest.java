package com.zking.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import redis.clients.jedis.Jedis;

public class RedisTest {

    @Test
    public void a(){
        Jedis jedis = new Jedis("47.107.120.48",6379);

        System.out.println(jedis.get("a")+"_"+jedis.get("b"));

    }
}
