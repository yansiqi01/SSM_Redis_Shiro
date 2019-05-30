package com.zking.service.impl;

import com.zking.dao.PowerMapper;
import com.zking.model.Power;
import com.zking.service.PowerService;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.crypto.hash.Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("powerService")
public class PowerServiceImpl implements PowerService {

    @Qualifier("powerMapper")
    @Autowired
    private PowerMapper powerMapper;

    /**
     * 根据员工id查询对应的权限数据 json
     * @param uid
     * @return
     */
    @Override
    public List<Map<String,Object>> getPowerByUserId(Integer uid) {
        List<Map<String,Object>> maps = new ArrayList<>();

        List<Power> powerByUserId = powerMapper.getPowerByUserId(uid);
        for (Power power : powerByUserId) {
            Map<String,Object> map = new HashMap<>();
            //开始生成json
            map.put("meunTitle",power.getPowerName());//大类菜单名称
            //开始生成菜单项
            List<Power> Tress = getPowerByUserTreeAndFid(power.getPowerId());//根据fid查找对应的菜单
            List<Map<String,Object>> treemaps = new ArrayList<>();
            for (Power tress : Tress) {
                HashMap<String, Object> treemap = new HashMap<>();
                treemap.put("treeTitile",tress.getPowerName());//菜单名称
                treemap.put("id",tress.getPowerId());//菜单id
                treemap.put("url",tress.getPowerUrl());//url
                treemaps.add(treemap);
                map.put("trees",treemaps);//添加到1级菜单下面
            }
            maps.add(map);
        }
        return maps;
    }

    /**
     * 根据父id查询tree树
     * @param fid
     * @return
     */
    @Override
    public List<Power> getPowerByUserTreeAndFid(Integer fid) {
        return powerMapper.getPowerByUserTreeAndFid(fid);
    }
}
