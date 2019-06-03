package com.zking.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Position  implements Serializable {
    private static final long serialVersionUID = -5850739900661205246L;
    private Integer positionId;
    private String positionName;
}
