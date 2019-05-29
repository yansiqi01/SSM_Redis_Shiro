package com.zking.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Receipt implements Serializable {
    private static final long serialVersionUID = -9183999006674166056L;
    private  Integer ReceiptId;//交接单Id
    private Car car;//外键(车ID)
    private Deliveryspot deliveryspot;//外键(配送点ID)
    private  String ReceiptCreatetime;//交接单生成时间
    private String OrderRemark;//备注
    private Oders oders;//外键(订单编号)
    private Integer ReceiptState;//交接订单状态


}
