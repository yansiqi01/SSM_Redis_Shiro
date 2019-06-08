package com.zking.model;

import lombok.Data;
import org.springframework.stereotype.Service;

import java.io.Serializable;

@Data
@Service
public class Oders implements Serializable {
    private static final long serialVersionUID = 7008329139808624325L;
    private Integer orderId;//订单ID
    private  Quser quser;
    private String orderSendname;//寄件人姓名
    private String orderSendaddress;//寄件人地址
    private String orderSendtel;//寄件人电话
    private String orderReceivename;//收件人姓名
    private String orderReceiveaddress;//收件人电话
    private String orderReceivetel;
    private Integer orderState;//订单状态
    private Double orderTotalprice;//总费用
    private Double orderInsureprice;//保价费用
    private GoodsType goodsType;//外键(物品类型ID)
    private Double orderGoodsprice;//物品估价
    private Double orderVolume;//物品体积
    private Double orderWeight;//物品重量
    private String orderRemark;//备注
    private String orderCreatetime;//订单生成时间
    private Deliveryspot deliveryspot;//外键(配送点Id
    private Car car;// 外键 CarID
    private Line line;//外键lineId
}
