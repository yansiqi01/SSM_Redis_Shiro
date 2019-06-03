package com.zking.service;

import com.zking.model.Position;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PositionService {

    /**
     * 获取所有的角色信息
     * @return
     */
    List<Position> getRoles();


    /**
     * 添加用户角色  第三方关系表
     * @param
     * @return
     */
    int addRoleandPostion(Integer uid,Integer positionid);


    /**
     * 根据用户id获取用户的角色信息
     * @param uid
     * @return
     */
    List<Position> getRolesByUserId(Integer uid);

}
