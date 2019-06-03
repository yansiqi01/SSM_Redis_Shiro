package com.zking.shiro;
import com.zking.model.Deliveryspot;
import com.zking.model.Employee;

import com.zking.model.User;
import com.zking.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;

/**
 * 后台用户登录
 */
public class MyRealm extends AuthorizingRealm {

//    @Resource
//    private UserService userService;

    private static final Logger logger = LogManager.getLogger(MyRealm.class);
    //授权

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        logger.info("===============================执行了授权");
        return null;
    }

    //认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {

        logger.info("===============================执行了认证");

        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo();

        String uname =(String) authenticationToken.getPrincipal();//获取登录的用户名
        String upwd = new String((char[])authenticationToken.getCredentials());//获取登录的密码

//        User user = userService.getUserByName(uname);//根据用户名查找用户信息
        User user = new User();
        user.setUserId(1);
        user.setUserName("admin");
        user.setUserPassword("123456");
//        user.setDeliveryspot(new Deliveryspot());
        user.setEmployee(new Employee());

        //开始认证
        if(user==null){
            throw new UnknownAccountException("账号不存在!");
        }
        if(!upwd.equals(user.getUserPassword())){
            throw new IncorrectCredentialsException("账户或密码不正确");
        }
        return   new SimpleAuthenticationInfo(user,upwd,this.getName());
    }
}
