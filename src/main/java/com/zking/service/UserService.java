package com.zking.service;

import com.zking.model.Employee;
import com.zking.model.User;
import com.zking.util.PageBean;
import com.zking.util.ResultUtil;

import java.util.List;
import java.util.Map;

public interface UserService {

    //查询所有用户
   Map<String,Object> getUsers(PageBean<User> pageBean);

    //根据用户名获取用户信息
    User getUserByName(String uname);

    /**
     * 添加用户
     * @param user
     * @return
     */
    int addUserEmp(User user);


    /**
     * 添加用户员工信息一起添加
     * @param user
     * @param employee
     * @return
     */
    Map<String,Object> addEmpByUser(User user, Employee employee,String[] roles);


    /**
     * deleteUserByUid
     * 根据用户id删除以及对应的员工信息（删除）
     * @param uid
     * @return
     */
    Map<String,Object> deleteUserEmpByUid(Integer uid);


    /**
     * 根据用户id获取用户信息
     * @param uid
     * @return
     */
    User getUserByUidAndEmp(Integer uid);


  /**
   * 修改 用户信息以及员工信息
   * @param user
   * @param employee
   * @return
   */
  int updateUserAndEmp(User user, Employee employee);


 /**
  * 修改 用户信息以及员工信息
  * @param user
  * @param employee
  * @return 返回结果码
  */
  ResultUtil AdminupdateUserAndEmp(User user, Employee employee);

    /**
     * 判断用户名是否存在  返回状态信息
     * @param uname
     * @return
     */
    ResultUtil checkAdminName(String uname);

    /**
     * 管理员批量删除用户员工
     * @param ids
     * @return
     */
    ResultUtil AdminDelUsers(List<Integer> ids);
}
