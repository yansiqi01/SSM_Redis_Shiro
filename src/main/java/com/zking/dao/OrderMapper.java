package com.zking.dao;

import com.zking.model.Oders;
import com.zking.model.Quser;
import org.springframework.stereotype.Service;

import java.util.Set;

@Service("orderMapper")
public interface OrderMapper {
    /**
     * @Author lrl
     * @param oders
     * @return
     * 增加订单
     */
    int addOrder(Oders oders);

    /**
     * 删除订单
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
