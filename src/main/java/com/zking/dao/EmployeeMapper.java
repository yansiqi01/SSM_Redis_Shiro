package com.zking.dao;

import com.zking.model.Employee;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

/**
 * 颜
 * 员工mapper
 */
@Service("employeeMapper")
public interface EmployeeMapper {

    /**
     * 添加员工
     * @param employee
     * @return
     */
    int addEmp(Employee employee);

    /**
     * 根据员工id删除
     * @param empid
     * @return
     */
    int deleteEmp(@Param("empid")Integer empid);


    /**
     * 根据员工id查找员工信息
     * @param id
     * @return
     */
    Employee getEmpById(@Param("id")Integer id);

}
