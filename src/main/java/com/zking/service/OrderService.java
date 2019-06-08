package com.zking.service;

import com.zking.model.Car;
import com.zking.model.Oders;
import com.zking.model.Quser;

import java.util.Set;

public interface OrderService {
    /**
     * @Author lrl
     * @param oders
     * @return
     * 增加订单
     */
    int addOrder(Oders oders);

    /**
     * 删除
     * @param oders
     * @return
     */
    int delOrder(Oders oders);

    /**
     * 订单管理员查看
     * @param
     * @return
     */
    Set<Oders> getOrders();

    /**
     * 派送车辆
     * @param oders
     * @return
     */
    int sendOrder(Oders oders);

    /**
     * 前台用户查询
     * @return
     */
    Set<Oders> getOrdersByQserId(Quser quser);

    /**
     * 前台用户查询单个
     * @param oders
     * @return
     */
    Oders getOderByorderId(Oders oders);

    /**
     * 修改订单
     * @param oders
     * @return
     */
    int updateOrder(Oders oders);
}
