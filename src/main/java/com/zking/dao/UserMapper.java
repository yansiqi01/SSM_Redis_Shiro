package com.zking.dao;

import com.zking.model.Employee;
import com.zking.model.Power;
import com.zking.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userMapper")
public interface UserMapper {

    //查询所有用户  查询
    List<User> getUsers(User user);


    /**
     * 根据用户名获取用户信息
     */
    User getUserByName(@Param("uname")String uname);

    /**
     * 添加一个用户
     * @param user
     * @return
     */
    int addUserEmp(User user);


    /**
     * 删除用户以及对应的员工信息
     * @param uid
     * @return
     */
    int deleteUserByUid(@Param("uid")Integer uid);


    /**
     * 根据用户id获取用户信息
     * @param uid
     * @return
     */
    User getUserByUidAndEmp(@Param("uid") Integer uid);

    /**
     * 修改 用户信息以及员工信息
     * @param user
     * @param employee
     * @return
     */
    int updateUserAndEmp(@Param("user") User user,@Param("employee") Employee employee);


    /**
     * 批量删除根据用户id
     * @param ids
     * @return
     */
    int deleteUsers(@Param("list") List<Integer> ids);


}
