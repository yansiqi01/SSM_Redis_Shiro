package com.zking.dao;

import com.zking.model.Quser;
import com.zking.model.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("qUserMapper")
public interface QUserMapper {
    /**
     * LRL
     * @param quser
     * @return
     */
    int addQuser(Quser quser);

    //查询所有用户
    List<User> getUsers();

    /**
     * QQ判断是否存在用户
     */
    Quser openid(String quserCode);

    /**
     *
     * @param quserCode
     * @return
     */

    int addOpenId(String quserCode);

    /**
     * 根据手机号获得对象
     */
    Quser getUserByUsername(Quser quser);

    /**
     * 修改手机号码
     */
    int updateTel(Quser quser);



}

