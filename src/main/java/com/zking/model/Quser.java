package com.zking.model;

import lombok.Data;
import org.springframework.stereotype.Service;

import java.io.Serializable;

@Data
@Service
public class Quser implements Serializable {
    private static final long serialVersionUID = 8850460285325555343L;
    private Integer quserId;//前台用户ID
    private String quserName;//前台用户名字
    private String quserPassword;//前台用户密码
    private String quserTel;//前台用户电话
    private String quserCode;//code码
}
