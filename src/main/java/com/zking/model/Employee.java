package com.zking.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Employee implements Serializable {
    private static final long serialVersionUID = -2277950635615433893L;
    private Integer EmpId;//员工ID
    private String EmpName;//员工姓名
    private String EmpSex;//员工性别
    private String EmpAddress;//员工地址
    private String EmpTel;//员工电话
    private String EmpWorkTime;//入职时间
    private Double EmpSalary;//员工月薪
    private String EmpCardId;//员工身份证
    private Position position;//外键(职位ID)
    private Deliveryspot deliveryspot;//外键(所属配送点)
    private Integer EmpFiag;//任职状态
}
