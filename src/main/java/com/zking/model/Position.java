package com.zking.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Position  implements Serializable {
    private Integer PositionId;
    private String PositionName;
}
