package com.zking.service.impl;

import com.zking.dao.DeliveryspotMapper;
import com.zking.model.Deliveryspot;
import com.zking.service.DeliveryspotService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("deliveryspotService")
public class DeliveryspotServiceImpl implements DeliveryspotService {

    @Resource()
    private DeliveryspotMapper deliveryspotMapper;

    /**
     * 获取所有配送点
     * @return
     */
    @Override
    public List<Deliveryspot> getDeliverys() {
        return deliveryspotMapper.getDeliverys();
    }
}
