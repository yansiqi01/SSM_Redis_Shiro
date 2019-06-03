package com.zking.dao;

import com.zking.model.Position;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("positionMapper")
public interface PositionMapper {

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
    int addRoleandPostion(@Param("uid") Integer uid,@Param("positionid") Integer positionid);


    /**
     * 根据用户id获取用户的角色信息
     * @param uid
     * @return
     */
    List<Position> getRolesByUserId(@Param("uid")Integer uid);
}
