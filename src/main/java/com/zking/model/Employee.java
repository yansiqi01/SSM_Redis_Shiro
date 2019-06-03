package com.zking.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Employee implements Serializable {
    private static final long serialVersionUID = -2277950635615433893L;
    private Integer empId;//员工ID
    private String empName;//员工姓名
    private String empSex;//员工性别
    private String empAddress;//员工地址
    private String empTel;//员工电话
    private String empWorkTime;//入职时间
    private Double empSalary;//员工月薪
    private String empCardId;//员工身份证
//    private Position position;//外键(职位ID)
    private Deliveryspot deliveryspot;//外键(所属配送点)
    private Integer empFiag;//任职状态
}
