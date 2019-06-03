package com.zking.service.impl;

import com.zking.dao.PositionMapper;
import com.zking.model.Position;
import com.zking.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("positionService")
public class PositionServiceImpl implements PositionService {

    @Resource
    private PositionMapper positionMapper;

    /**
     * 获取所有的角色信息
     * @return
     */
    @Override
    public List<Position> getRoles() {
        return positionMapper.getRoles();
    }

    /**
     * 批量添加用户角色
     * @param
     * @return
     */
    @Override
    public int addRoleandPostion(Integer uid,Integer positionid){
        return positionMapper.addRoleandPostion(uid,positionid);
    }

    /**
     * 根据用户id获取用户的角色信息
     * @param uid
     * @return
     */
    @Override
    public List<Position> getRolesByUserId(Integer uid) {
        return positionMapper.getRolesByUserId(uid);
    }
}
