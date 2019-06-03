package com.zking.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Deliveryspot  implements Serializable {
    private static final long serialVersionUID = -8211690916446009897L;
    private Integer deliveryspotId;//配送路线
    private String  deliveryspotName;//配送点名
    private String  deliveryspotProvince;//所属省
    private  String  deliveryspotCity;//所属市
    private  Employee employee;//外键(配送点管理员)
    private  String deliveryspotTel;//配送点电话
}
