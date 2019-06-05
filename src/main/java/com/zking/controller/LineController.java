package com.zking.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zking.model.Deliveryspot;
import com.zking.model.Line;
import com.zking.model.Linetaile;
import com.zking.service.DeliveryspotService;
import com.zking.service.LineService;
import org.apache.http.HttpRequest;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName LineController
 * @Author likai
 * @Date 2019/06/3 18:39
 **/
@Controller
public class LineController {

    @Autowired
    private LineService lineService;

    @Autowired
    private DeliveryspotService deliveryspotService;

    @Autowired
    private Line line;

    @Autowired
    private Linetaile linetaile;

    @Autowired
    private Deliveryspot deliveryspot;

    @ResponseBody
    @RequestMapping("/getLines")
    Map<String,Object> getLines(@Param("page") int page,@Param("limit") int limit){
        //接受前台分页参数
        //System.out.println("第几页"+page+"=====每页多少条："+limit);
        //用来返回最后的map
        Map<String,Object> lineMaps = new HashMap<>();
        //分页
        Page pageLine = PageHelper.startPage(page, limit);
        //得到所有的信息
        List<Line> lineAndDeliveryspot = lineService.getLineAndDeliveryspot();
        //new一个新集合用来装map集合，因为map集合的key重复的话会覆盖，
        List<Map<String,Object>> ls = new ArrayList<>();
        for (Line line : lineAndDeliveryspot) {
            //new一个map集合用来对应前台layui不能多层嵌套问题，取出值放在同一层
            Map<String,Object> maps = new HashMap<>();
            maps.put("LineId",line.getLineId());
            maps.put("LineName",line.getLineName());
            maps.put("LineTh",line.getLineTh());
            maps.put("deliveryspotName",line.getLinetaile().getDeliveryspot().getDeliveryspotName());
            maps.put("deliveryspotProvince",line.getLinetaile().getDeliveryspot().getDeliveryspotProvince());
            maps.put("deliveryspotCity",line.getLinetaile().getDeliveryspot().getDeliveryspotCity());
            //装到list集合中成为一个个的对象 就不会产生key覆盖的问题
            ls.add(maps);
        }
        //获取总函数  根据layui绑定数据的格式，分页必须有count,才会成功
        //layui表格绑数据   count:分页总行数、code;msg:返回结果码和信息、 data:查询的数据
        lineMaps.put("count",pageLine.getTotal());
        lineMaps.put("code",0);
        lineMaps.put("msg","绑定数据");
        lineMaps.put("data",ls);
        return lineMaps;
    }



    /**
     * @ResponseBody  处理前台404错误。Spring框架问题
     * 增加线路选择配送点下拉框，得到所有的配送点名字
     * @return
     */
    @ResponseBody
    @RequestMapping("/getDeliveryspotNames")
    Map getgetDeliveryspotNames(){
        Map<Integer,String> maps = new HashMap<>();
        List<Deliveryspot> deliverys = deliveryspotService.getDeliverys();
        for (Deliveryspot delivery : deliverys) {
            maps.put(delivery.getDeliveryspotId(),delivery.getDeliveryspotName());
        }
        return maps;
    }


    /**
     * @ResponseBody  处理前台404错误。Spring框架问题
     * 根据线路ID删除线路和线路基本信息
     * @param request
     */
    @ResponseBody
    @RequestMapping("/delLine")
    void delLine(HttpServletRequest  request){
        String lineId = request.getParameter("LineId");
        //删除线路
        lineService.delLine(Integer.parseInt(lineId));
        //删除线路基本信息
        lineService.delLinetaile(Integer.parseInt(lineId));
    }

    @ResponseBody
    @RequestMapping("/addLine")
    void addLine(HttpServletRequest request){
        System.out.println("执行增加方法++++++++++++++++++++");
        String lineName = request.getParameter("lineName");
        String lineTH = request.getParameter("lineTH");
        String deliveryspotId = request.getParameter("deliveryspot");
        System.out.println("线路名称："+lineName+"==里程："+lineTH+"==配送点："+deliveryspot);

        //线路的名称和里程
        line.setLineName(lineName);
        line.setLineTh(Double.parseDouble(lineTH));
        System.out.println(line);

        //配送点的ID
        deliveryspot.setDeliveryspotId(Integer.parseInt(deliveryspotId));
        System.out.println(deliveryspot);

        //增加线路基本信息
        linetaile.setLine(line);
        linetaile.setDeliveryspot(deliveryspot);
        System.out.println(linetaile);

        int i = lineService.addLine(line);
        linetaile.setLine(line);
        int i1 = lineService.addLinetaile(linetaile);
        System.out.println("增加线路："+i+"==增加线路基本信息"+i1);
    }
}
