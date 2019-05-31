package com.zking.controller;
import com.google.gson.Gson;
import com.zking.model.Deliveryspot;
import com.zking.model.Employee;

import com.zking.model.User;
import com.zking.redis.RedisTemplateUtil;
import com.zking.service.PowerService;
import com.zking.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.security.auth.Subject;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class UserController {

    private static final String KEY = "a";

    //声明一个日志
    private static Logger logger = LogManager.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private PowerService powerService;

    @Resource
    private RedisTemplate<String, Object> redisTemplate;


    //自动装配redisTemplateUtil对象
    @Autowired
    private RedisTemplateUtil redisTemplateUtil;


    //测试springmvc 和mybatis
    @ResponseBody
    @RequestMapping("/test")
    public String test(){

        User user = new User();
        System.out.println("用户数据：===================================="+userService.getUsers());
        System.out.println("测试成功。。。");
        return userService.getUsers()+"";
    }





    //测试缓存
    @RequestMapping("/redis")
    public String b(){

//        System.out.println("数据打印："+redisTemplate.opsForValue().get("user1"));
        System.out.println(redisTemplateUtil.getString("user1"));
  /*      logger.info("===========================================执行了方法");
        logger.error("==========================================执行了异常日志打印");
        logger.debug("==========================================执行了debug日志打印");*/
//        System.out.println("缓存数据："+redisTemplateUtil.getString(KEY));

//        System.out.println("缓存数据:"+redisTemplate.opsForValue().get(KEY).toString());

//        System.out.println("打印："+redisTemplateUtil.getString("a"));
//        String s = (String) redisTemplateUtil.get(KEY);

//        List<User> users=null;
//
//        if(s==null){
//            System.out.println("缓存中没有数据...去数据库查询");
//            users = userService.getUsers();
//            redisTemplateUtil.set(KEY,users);
//        }else {
//            System.out.println("缓存中有数据去缓存中查找。。。");
//            return s;
//        }
//        return users.toString();
        return null;
    }


    /**
     * 根据用户id查询对应的权限菜单
     */
    @ResponseBody
    @RequestMapping("/userByPower")
    public String getPower(){

        //定义一个userId
        int uid = 1;
        return new Gson().toJson(powerService.getPowerByUserId(uid));
    }




    @RequestMapping(value = "/adminLogin",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> login(User user,Map map){
        System.out.println("后台接收数据:"+user);
        map.put("code",1);
        map.put("msg",1);
        return map;
    }












}
