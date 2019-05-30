package com.zking.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Car implements Serializable {

    private static final long serialVersionUID = 1278240035261357193L;
    private  Integer carId;//车ID
    private  String  corkNo;//车牌号
    private  CarType carType;//外键（车类型ID）
    private  Double  carSize;//车容量
    private  Double carTonnage;//车吨位
    private  String cuyTiem;//购车时间
    private  String carLeavetime;//发车时间
    private  Integer carstateId;//车辆状态
    private  Line cine;//外键(线路ID)
    private  Employee employee;//外键（员工ID）
    private  String carRemark;//备注
}
