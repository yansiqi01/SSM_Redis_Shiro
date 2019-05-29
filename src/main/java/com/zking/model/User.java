package com.zking.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class User implements Serializable {

    private Integer userID;
    private String userName;
    private String userPassword;

}
