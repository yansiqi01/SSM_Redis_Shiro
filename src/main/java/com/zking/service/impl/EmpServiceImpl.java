package com.zking.service.impl;

import com.zking.dao.EmployeeMapper;
import com.zking.model.Employee;
import com.zking.service.EmployeeService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 员工服务 实现类
 * yan
 */
@Service("employeeService")
public class EmpServiceImpl implements EmployeeService {

    @Resource
    private EmployeeMapper employeeMapper;

    @Override
    public int addEmp(Employee employee) {
        return employeeMapper.addEmp(employee);
    }

    /**
     * 根据员工id查找员工信息
     * @param id
     * @return
     */
    @Override
    public Employee getEmpById(Integer id) {
        return employeeMapper.getEmpById(id);
    }
}
