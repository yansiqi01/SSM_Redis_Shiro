package com.zking.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Car implements Serializable {

    private static final long serialVersionUID = 1278240035261357193L;
    private  Integer CarId;//车ID
    private  String  WorkNo;//车牌号
    private  CarType carType;//外键（车类型ID）
    private  Double  CarSize;//车容量
    private  Double CarTonnage;//车吨位
    private  String BuyTiem;//购车时间
    private  String CarLeavetime;//发车时间
    private  Integer CarstateId;//车辆状态
    private  Line line;//外键(线路ID)
    private  Employee employee;//外键（员工ID）
    private  String CarRemark;//备注
}
