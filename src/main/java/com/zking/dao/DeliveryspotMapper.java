package com.zking.dao;

import com.zking.model.Deliveryspot;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 配送点mapper
 */
@Service("deliveryspotMapper")
public interface DeliveryspotMapper {

    /**
     *  获取所有的配送点
     * @return
     */
    List<Deliveryspot> getDeliverys();

}
