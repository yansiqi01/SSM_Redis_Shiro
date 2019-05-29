package com.zking.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class CarType  implements Serializable {
    private static final long serialVersionUID = 1569312407598572271L;
    private Integer CarTypeId;//车类型ID
    private String CarTypeName;//车类型名
}
