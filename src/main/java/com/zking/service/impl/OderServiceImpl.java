package com.zking.service.impl;

import com.zking.dao.OrderMapper;
import com.zking.model.Oders;
import com.zking.model.Quser;
import com.zking.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Set;

@Service("oderService")
public class OderServiceImpl implements OrderService {
    @Resource
    private OrderMapper orderMapper;

    /**
     * 增加订单
     * @param oders
     * @return
     */
    @Override
    public int addOrder(Oders oders) {
        return orderMapper.addOrder(oders);
    }
    /**
     * 删除订单
     * @param oders
     * @return
     */
    @Override
    public int delOrder(Oders oders) {
        return orderMapper.delOrder(oders);
    }

    /**
     *
     * @return
     */
    @Override
    public Set<Oders> getOrders() {
        return orderMapper.getOrders();
    }

    /**
     * 派送货物
     * @param oders
     * @return
     */
    @Override
    public int sendOrder(Oders oders) {
        return orderMapper.sendOrder(oders);
    }

    /**
     * 前台用户查询
     * @param quser
     * @return
     */
    @Override
    public Set<Oders> getOrdersByQserId(Quser quser) {
        return orderMapper.getOrdersByQserId(quser);
    }

    @Override
    public Oders getOderByorderId(Oders oders) {
        return orderMapper.getOderByorderId(oders);
    }

    /**
     * 支付订单
     * @param oders
     * @return
     */
    @Override
    public int updateOrder(Oders oders) {
        return orderMapper.updateOrder(oders);
    }


}
