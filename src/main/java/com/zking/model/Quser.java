package com.zking.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Quser implements Serializable {
    private static final long serialVersionUID = 8850460285325555343L;

    private Integer QuserId;//前台用户ID
    private String QuserName;//前台用户名字
    private String QuserPassword;//前台用户密码
    private String QuserTel;//前台用户电话
    private String QuserCode;//code码
}
