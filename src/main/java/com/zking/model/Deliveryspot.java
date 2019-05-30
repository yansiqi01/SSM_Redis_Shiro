package com.zking.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Deliveryspot  implements Serializable {
    private static final long serialVersionUID = -8211690916446009897L;
    private Integer DeliveryspotId;//配送路线
    private String  DeliveryspotName;//配送点名
    private String  DeliveryspotProvince;//所属省
    private  String  DeliveryspotCity;//所属市
    private  Employee employee;//外键(配送点管理员)
    private  String DeliveryspotTel;//配送点电话
}
