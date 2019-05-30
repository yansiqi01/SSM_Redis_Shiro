package com.zking.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class User implements Serializable {

    private static final long serialVersionUID = 8640733153759382281L;
    private Integer UserId;//用户ID
    private String UserName;//用户姓名
    private String UserPassword;//用户密码
    private Deliveryspot deliveryspot;//外键(权限ID)
    private Employee employee;//外键(员工ID)

}
