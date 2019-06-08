package com.zking.dao;

import com.zking.model.Power;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 权限菜单
 */
@Service("powerMapper")
public interface PowerMapper {

    /**
     * 根据员工id查询对应的权限
     * @param uid
     * @return
     */
    List<Power> getPowerByUserId(@Param("uid") Integer uid);

    /**
     * 根据父id查询tree树
     * @param fid
     * @return
     */
    List<Power> getPowerByUserTreeAndFid(@Param("fid")Integer fid);





}
