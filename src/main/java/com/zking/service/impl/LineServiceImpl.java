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
    public List<Line> getLineAndDeliveryspot(Line line) {
        return lineMapper.getLineAndDeliveryspot(line);
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

    /**
     * 修改线路信息
     *
     * @param lineID
     * @param line
     * @return
     */
    @Override
    public int editLineByLineID(Integer lineID, Line line) {
        return lineMapper.editLineByLineID(lineID,line);
    }

    /**
     * 修改线路基本信息的配送点
     *
     * @param lineID
     * @param linetaile
     * @return
     */
    @Override
    public int editLinetaileByLineID(Integer lineID, Linetaile linetaile) {
        return lineMapper.editLinetaileByLineID(lineID,linetaile);
    }


}
