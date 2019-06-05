package com.zking.service.impl;

import com.zking.dao.LineMapper;
import com.zking.model.Line;
import com.zking.model.Linetaile;
import com.zking.service.LineService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName LineServiceImpl
 * @Author likai
 * @Date
 **/
@Service("lineService")
public class LineServiceImpl implements LineService {

    @Resource
    private LineMapper lineMapper;


    /**
     * 得到所有的线路及配送点信息基本信息
     *
     * @return
     */
    @Override
    public List<Line> getLineAndDeliveryspot() {
        return lineMapper.getLineAndDeliveryspot();
    }

    /**
     * 根绝线路ID删除
     *
     * @param lineId
     * @return
     */
    @Override
    public int delLine(Integer lineId) {
        return lineMapper.delLine(lineId);
    }

    /**
     * 根绝线路ID删除线路基本信息
     *
     * @param lineId
     * @return
     */
    @Override
    public int delLinetaile(Integer lineId) {
        return lineMapper.delLinetaile(lineId);
    }

    /**
     * 增加一条线路
     *
     * @param line
     * @return
     */
    @Override
    public int addLine(Line line) {
        return lineMapper.addLine(line);
    }

    /**
     * 增加一条线路基本信息
     *
     * @param linetaile
     * @return
     */
    @Override
    public int addLinetaile(Linetaile linetaile) {
        return lineMapper.addLinetaile(linetaile);
    }
}
