package com.zking.service;

import com.zking.model.Deliveryspot;

import java.util.List;

/**
 * 配送的mapper
 */
public interface DeliveryspotService {

    /**
     *  获取所有的配送点
     * @return
     */
    List<Deliveryspot> getDeliverys();
}
