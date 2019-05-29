package com.zking.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class GoodsType implements Serializable {
    private static final long serialVersionUID = 7618523657406875766L;
    private Integer GoodsId;//物品类别
    private String GoodsType;//物品类别名称
}
