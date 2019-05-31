package com.zking.service;

import com.zking.model.Power;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface PowerService {

    /**
     * 根据员工id查询对应的权限
     * @param uid
     * @return
     */
    List<Map<String,Object>> getPowerByUserId(Integer uid);


    /**
     * 根据父id查询tree树
     * @param fid
     * @return
     */
    List<Power> getPowerByUserTreeAndFid(@Param("fid")Integer fid);
}
