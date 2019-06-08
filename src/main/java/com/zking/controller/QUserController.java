package com.zking.controller;

import com.qq.connect.QQConnectException;
import com.qq.connect.api.OpenID;
import com.qq.connect.javabeans.AccessToken;
import com.qq.connect.oauth.Oauth;
import com.show.api.ShowApiRequest;
import com.zking.model.Quser;
import com.zking.service.QuserService;
import org.apache.http.HttpResponse;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.util.StringUtils;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

@Controller
public class QUserController {

    @Autowired
    private QuserService quserService;

    /**
     * 获取验证码
     * @param response
     */
     @RequestMapping("/getyzm")
    public void getyzm(HttpServletResponse response, @Param("quserTel")String quserTel){
         System.out.println("============"+quserTel);
        Random rd = new Random();
        int randomu = rd.nextInt(10000);
        System.out.println("==============前"+randomu);
        ShowApiRequest res = new ShowApiRequest("http://route.showapi.com/28-1","90435","c5e347e12e89408d851f821047ef05a1");
        res.addTextPara("mobile",quserTel);
        res.addTextPara("content","{\"code\":\""+randomu+"\",\"minute\":\"3\"}");
        res.addTextPara("tNum","T170317004362");
        res.post();
        try {
            PrintWriter writer = response.getWriter();
            writer.print(randomu);
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     *注册
     * @param quser
     * @return
     */
   @RequestMapping("/register")
    public String  register(Quser quser){
       System.out.println("执行了=========");
       int n = quserService.addQuser(quser);
       System.out.println("user========="+quser);
       if(n>0){
           return "login";
       }
       return  null;
   }

    /**
     * QQ注册
     * @param request
     * @param response
     * @return
     * @throws IOException
     * @throws QQConnectException
     */
    @RequestMapping("/QQlogin")
    public String  QQlogin(HttpServletRequest request, HttpServletResponse response) throws IOException, QQConnectException {
        String  QQloginUrl = new Oauth().getAuthorizeURL(request);
        request.setCharacterEncoding("utf-8");
        response.sendRedirect(QQloginUrl);
        return null;
    }
    @RequestMapping("/QQCallBack")
    public String QQCallBack(HttpServletRequest request) throws QQConnectException {
        String code = request.getParameter("code");
        System.out.println("==============code"+code);
        //第一步获取授权码
        AccessToken accessTokenobj = new Oauth().getAccessTokenByRequest(request);
        String accessToken = accessTokenobj.getAccessToken();
        System.out.println("accessToken========"+accessToken);
        //第二步获取accssToken
        if(StringUtils.isEmpty(accessToken)){
            return null;
        }
        OpenID openID = new OpenID(accessToken);
        String userOpenID = openID.getUserOpenID();
        request.getSession().setAttribute("userOpenID",userOpenID);
        System.out.println("===================userOpenID"+userOpenID);
        if(!StringUtils.isEmpty(userOpenID)){
            Quser quser = quserService.openid(userOpenID);
            System.out.println("========="+quser);
            if(quser==null){
                int id = quserService.addOpenId(userOpenID);
                return "huidiao";
            }
            else{
                request.getSession().setAttribute("QUser",quser);
                return "index";
            }
        }
        return  null;
    }

    /**
     * 登录
     * @param quser
     * @param request
     * @return
     */
    @RequestMapping("/login")
    public String  login(Quser quser,HttpServletRequest request){
        Quser userByUsername = quserService.getUserByUsername(quser);
        if(userByUsername!=null){
            request.getSession().setAttribute("QUser",userByUsername);
            return "index";
        }
        else {
            return "login";
        }
    }


    /**
     * 添加手机号码
     * @param quser
     * @param request
     * @return
     */
    @RequestMapping("/updateTel")
    public String  updateTel(Quser quser,HttpServletRequest request){
       quser.setQuserCode((String)request.getSession().getAttribute("userOpenID"));
        int i = quserService.updateTel(quser);
        Quser updateName = quserService.getUserByUsername(quser);
        if(i>0){
            request.getSession().setAttribute("QUser",updateName);
            return "index";
        }
        else {
            return null;
        }
    }
    /**
     * 判断用户是否存在
     *
     */
    @RequestMapping("/rzuser")
    public void getUser(Quser quser, HttpServletResponse response,HttpServletRequest request) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        Quser userByUsername = quserService.getUserByUsername(quser);
        PrintWriter writer = response.getWriter();
        if(userByUsername!=null){
            writer.print(1);
        }
        writer.flush();
        writer.close();
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        request.getSession().setAttribute("QUser",null);
        return "index";
    }
}
