package com.zking.controller;

import com.google.gson.Gson;
import com.zking.model.Deliveryspot;
import com.zking.model.Employee;
import com.zking.model.Position;
import com.zking.model.User;
import com.zking.redis.RedisTemplateUtil;
import com.zking.service.*;
import com.zking.util.PageBean;
import com.zking.util.ResponseUtil;
import com.zking.util.ResultUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
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

    @Autowired
    private EmployeeService employeeService;
    @Resource
    private RedisTemplate<String, Object> redisTemplate;


    //自动装配redisTemplateUtil对象
    @Autowired
    private RedisTemplateUtil redisTemplateUtil;

    @Autowired
    private PositionService positionService;

    @Autowired
    private DeliveryspotService deliveryspotService;


    /**
     * 用户管理  页面数据渲染 分页查询
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("/getUsers")
    public Map<String, Object> getAllusers(HttpServletRequest request){
        //获取分页参数
        Integer pageIndex =Integer.parseInt(request.getParameter("page"));
        Integer pageSize = Integer.parseInt(request.getParameter("limit"));
        String search = request.getParameter("search");//查询参数
        User user = new User();
        user.setUserName(search);
//        Map<String, Object> users = userService.getUsers(pageIndex, pageSize);

        return userService.getUsers( new PageBean<User>(pageIndex,pageSize,user));
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
        int uid = 18;
        return new Gson().toJson(powerService.getPowerByUserId(uid));
    }


    /**
     * 后台管理人员登陆认证
     * @param user
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/adminLogin",method = RequestMethod.POST)
    public void login(User user,HttpServletResponse response)throws Exception{
        Map<String,Object> map = new HashMap<>();
        //1.获得主体
        Subject subject = SecurityUtils.getSubject();
        //2.把用户名密码生成认证token
        UsernamePasswordToken token = new UsernamePasswordToken(user.getUserName(), user.getUserPassword());
        //3.开始认证
        try {
            subject.login(token);
            User u = (User)subject.getPrincipal();
            subject.getSession().setAttribute("user",u);//用户放入session
            map.put("code",0);
        } catch (UnknownAccountException uae) {
            // UnknownAccountException账号不存在异常
            logger.info("===============账号不存在异常=>"+token.getPrincipal());
            map.put("code",1);
            map.put("msg","账户不存在");
        } catch (IncorrectCredentialsException ice) {
            // IncorrectCredentialsException密码错误异常
            logger.info("===============密码错误异常=>"+token.getPrincipal());
            map.put("code",1);
            map.put("msg","用户名或密码有误");
        }  catch (AuthenticationException ae) {
            // AuthenticationException即验证不通过异常，为前面几个异常的父类
            map.put("code",1);
            map.put("msg","用户名或密码有误");
        }
        //响应数据
        ResponseUtil.write(response,map);
    }


    /**
     * 管理员添加员工
     * @param user
     * @param employee
     * @param rolesid
     * @param response
     * @throws Exception
     */
    @RequestMapping("/addemp")
    public void AddEmp(User user, Employee employee,String[] rolesid,HttpServletResponse response) throws Exception{
        logger.info("==============================后台接收数据:"+user+"_____"+employee+"============================:");
//        HttpServletRequest request = ((ServletRequestAttributes) (RequestContextHolder.currentRequestAttributes())).getRequest();
//        String[] rolesid = request.getParameterValues("rolesid");
        System.out.println("==============================角色信息"+rolesid);
        for (String integer : rolesid) {
            System.out.println("角色Id = " + integer);
        }

        //开始添加
        Map<String, Object> map = userService.addEmpByUser(user, employee,rolesid);
        ResponseUtil.write(response,map);
    }


    /**
     * 前台ajax删除用户  返回对应结果码
     * @param uid
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/delUseremp",method = RequestMethod.POST)
    public Map<String,Object> adminDelUser(Integer uid){
        return userService.deleteUserEmpByUid(uid);
    }


    /**
     * 测试用户增加
     * @return
     */
    @RequestMapping("/adduser")
    @ResponseBody
    public Map<String,Object> ad(){
        User user = new User();
        user.setUserName("admins");
        user.setUserPassword("123456");
        //线路
        Deliveryspot deliveryspot = new Deliveryspot();
        deliveryspot.setDeliveryspotId(1);
        user.setDeliveryspot(deliveryspot);
        //对应员工id
        Employee employee = new Employee();
        employee.setEmpId(3);
        user.setEmployee(employee);

        int i = userService.addUserEmp(user);
        HashMap<String, Object> map = new HashMap<>();
        map.put("msg","返回结果码");
        map.put("code",i);
        return map;
    }



    private static final String ADDEMP_USER="/admin/addemp";

    /**
     * 添加页面数据渲染
     * @return
     */
    @RequestMapping("/getTreeRole")
    public ModelAndView addempUserView(){
        ModelAndView modelAndView = new ModelAndView();
        RoleAnddeliverysApply(modelAndView);//渲染数据
        modelAndView.setViewName(ADDEMP_USER);
        return modelAndView;
    }




    private static final String EDITEMP_USER="/admin/editemp";

    /**
     * 后台管理人员点击修改员工  员工信息数据渲染加载
     * @param uid
     * @return
     */
    @RequestMapping("/preeditemp")
    public ModelAndView adminEditEmp(Integer uid){

        ModelAndView mv = new ModelAndView();
        User user = userService.getUserByUidAndEmp(uid);
        mv.addObject("user",user);

        List<Position> userRole = positionService.getRolesByUserId(uid);
        mv.addObject("userRole",userRole);

        RoleAnddeliverysApply(mv);//渲染数据  角色下拉框以及配送点下拉框数据

        mv.setViewName(EDITEMP_USER);
        return mv;
    }

    /**
     * 用户信息修改
   * @param user
     * @param employee
     * @param rolesid
     * @return
     */
    @RequestMapping("/editUseremp")
    @ResponseBody
    public ResultUtil updateEmpUser(User user, Employee employee,String[] rolesid){
        System.out.println("===========================提交数据打印=======================");
        System.out.println(user);
        System.out.println(employee);
        System.out.println(rolesid);
        Map<String,Object> map = new HashMap<>();
        map.put("user",user);
        map.put("employee",employee);
        map.put("rolesid",rolesid);
        return userService.AdminupdateUserAndEmp(user,employee);
    }

    /**
     * 判断用户名是否存在
     * @param uname
     * @return
     */
    @RequestMapping("/checkAdminName")
    @ResponseBody
    public ResultUtil checkName(String uname){
        return userService.checkAdminName(uname);
    }


    /**
     * 批量删除用户
     * @param ids
     * @return
     */
    @RequestMapping("/dels")
    @ResponseBody
    public ResultUtil delUsers(@RequestParam(value = "ids[]") List<Integer> ids){
        return userService.AdminDelUsers(ids);
    }


    /**
     * 获取所有角色信息
     * @return
     */
    @ResponseBody
    @RequestMapping("/getPositions")
    public ResultUtil getPositions(){
        List<Position> roles = positionService.getRoles();
        return new ResultUtil(200,"success",roles);
    }


    /**
     * 后台操作人员退出
     * @return
     */
    private static final String LOGIN_OUT="/admin/login.jsp";
    @RequestMapping("/loginout")
    public ModelAndView userLoginout(ModelAndView mv){
        SecurityUtils.getSubject().logout();//清空用户会话
        mv.setViewName("redirect:"+LOGIN_OUT);
        return mv;
    }






    //角色信息以及配送单信息数据渲染  未绑定（工具方法）
    public void RoleAnddeliverysApply(ModelAndView mv){
        //根据用户信息获取对应的角色
        List<Position> roles = positionService.getRoles();
        //获取所有配送点
        List<Deliveryspot> deliverys = deliveryspotService.getDeliverys();
        mv.addObject("roles",roles);
        mv.addObject("deliverys",deliverys);
    }





















}
