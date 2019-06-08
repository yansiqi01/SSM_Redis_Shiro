package com.zking.service.impl;

import com.zking.dao.QUserMapper;
import com.zking.model.Quser;
import com.zking.service.QuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("quserService")
public class QuserServiceImpl implements QuserService {

    @Autowired
    private QUserMapper qUserMapper;
    @Override
    public int addQuser(Quser quser) {
        return qUserMapper.addQuser(quser);
    }

    @Override
    public Quser openid(String QuserCode) {
        return qUserMapper.openid(QuserCode);
    }

    @Override
    public int addOpenId(String QuserCode) {
        return qUserMapper.addOpenId(QuserCode);
    }

    @Override
    public Quser getUserByUsername(Quser quser) {
        return qUserMapper.getUserByUsername(quser);
    }

    @Override
    public int updateTel(Quser quser) {
        return qUserMapper.updateTel(quser);
    }


}
