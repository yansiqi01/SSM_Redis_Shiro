package com.zking.model;

import lombok.Data;
import org.springframework.stereotype.Service;

import java.io.Serializable;

@Data
@Service
public class CarType  implements Serializable {
    private static final long serialVersionUID = 1569312407598572271L;
    private Integer carTypeId;//车类型ID
    private String carTypeName;//车类型名
}
