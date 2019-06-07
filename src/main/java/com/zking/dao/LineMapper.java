package com.zking.dao;

import com.zking.model.Line;
import com.zking.model.Linetaile;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName LineMapper
 * @Author likai
 * @Date 2019/6/3
 **/
@Service("lineMapper")
public interface LineMapper {

    /**
     * 得到所有的线路及配送点信息基本信息
     * @return
     */
    List<Line> getLineAndDeliveryspot(Line line);

    /**
     * 根绝线路ID删除
     * @param lineId
     * @return
     */
    int delLine(Integer lineId);

    /**
     * 根绝线路ID删除线路基本信息
     * @param lineId
     * @return
     */
    int delLinetaile(Integer lineId);

    /**
     * 增加一条线路
     * @param line
     * @return
     */
    int addLine(Line line);

    /**
     * 增加一条线路基本信息
     * @param linetaile
     * @return
     */
    int addLinetaile(Linetaile linetaile);

    /**
     * 修改线路信息
     * @param line
     * @param line
     * @return
     */
    int editLineByLineID(Integer lineID,Line line);

    /**
     * 修改线路基本信息的配送点
     * @param lineID
     * @param linetaile
     * @return
     */
    int editLinetaileByLineID(Integer lineID,Linetaile linetaile);

}
