package com.zking.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Oders implements Serializable {
    private static final long serialVersionUID = 7008329139808624325L;
    private Integer OrderId;//订单ID
    private String OrderSendname;//寄件人姓名
    private String OrderSendaddress;//寄件人地址
    private String OrderSendtel;//寄件人电话
    private String OrderReceivename;//收件人姓名
    private String OrderReceiveaddress;//收件人电话
    private Integer OrderState;//订单状态
    private Double OrderTotalprice;//总费用
    private Double OrderInsureprice;//保价费用
    private GoodsType goodsType;//外键(物品类型ID)
    private Double OrderGoodsprice;//物品估价
    private Double OrderVolume;//物品体积
    private Double OrderWeight;//物品重量
    private String OrderRemark;//备注
    private String OrderCreatetime;//订单生成时间
    private Deliveryspot deliveryspot;//外键(配送点Id)
}
