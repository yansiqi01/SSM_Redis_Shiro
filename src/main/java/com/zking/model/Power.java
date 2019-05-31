package com.zking.model;

import lombok.Data;

import java.io.Serializable;

/**
 * 菜单类
 */
@Data
public class Power  implements Serializable {
    private static final long serialVersionUID = -757798325155608861L;
    private Integer PowerId;//权限ID
    private String PowerName;//权限名称
    private String PowerUrl; //url
    private String PowerFid; //父id
}
