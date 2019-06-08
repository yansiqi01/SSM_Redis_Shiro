package com.zking.service;

import com.zking.model.Quser;

public interface QuserService {
    /**
     * LRL
     * @param quser
     * @return
     */
    int addQuser(Quser quser);


    /**
     * QQ判断是否存在用户
     */
    Quser openid(String quserCode);

    /**
     *
     * @param QuserCode
     * @return
     */

    int addOpenId(String quserCode);


    /**
     * 根据手机号获得对象
     */
     Quser getUserByUsername(Quser quser);

    /**
     * 修改手机号码
     * @param quser
     * @return
     */
    int updateTel(Quser quser);
}
