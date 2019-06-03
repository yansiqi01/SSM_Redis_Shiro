package com.zking.service;

import com.zking.model.Employee;
import org.apache.ibatis.annotations.Param;

/**
 * 员工服务类
 * yan
 */
public interface EmployeeService {

    /**
     * 添加员工
     * @param employee
     * @return
     */
    int addEmp(Employee employee);


    /**
     * 根据员工id查找员工信息
     * @param id
     * @return
     */
    Employee getEmpById(Integer id);
}
