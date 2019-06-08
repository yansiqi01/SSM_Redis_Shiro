package com.zking.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zking.dao.EmployeeMapper;
import com.zking.dao.PositionMapper;
import com.zking.dao.UserMapper;
import com.zking.model.Employee;
import com.zking.model.User;
import com.zking.service.UserService;
import com.zking.util.PageBean;
import com.zking.util.ResultUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("userService")
public class UserServiceImpl implements UserService {


    @Resource
    private UserMapper userMapper;

    @Resource
    private EmployeeMapper employeeMapper;

    @Resource
    private PositionMapper positionMapper;

    @Override
    public Map<String,Object> getUsers(PageBean<User> pageBean) {
        Map<String,Object> map = new HashMap<>();
        //开启数据分页
        Page<Object> page = PageHelper.startPage(pageBean.getPageIndex(),pageBean.getPageSize());
        //查询
        List<User> users = userMapper.getUsers(pageBean.getT());

        //开始数据处理
        List<Map<String,Object>> ls = new ArrayList<>();
        for (User user : users) {
            Map<String,Object> usermap = new HashMap<>();
            usermap.put("userId",user.getUserId());
            usermap.put("userName",user.getUserName());
            usermap.put("userPassword",user.getUserPassword());
            usermap.put("EmpName",user.getEmployee().getEmpName());
            usermap.put("EmpSex",user.getEmployee().getEmpSex());
            usermap.put("EmpAddress",user.getEmployee().getEmpAddress());
            usermap.put("EmpTel",user.getEmployee().getEmpTel());
            usermap.put("EmpWorkTime",user.getEmployee().getEmpWorkTime());
            usermap.put("EmpSalary",user.getEmployee().getEmpSalary());
            ls.add(usermap);
        }

        map.put("code",0);//状态码
        map.put("count",page.getTotal());//总行数
        map.put("data",ls);//数据

        //返回数据
        return map;
    }

    /**
     *
     *  根据用户名获取用户信息
     *
     * @param uname
     * @return
     */
    @Override
    public User getUserByName(String uname) {
        return userMapper.getUserByName(uname);
    }

    /**
     * 添加用户
     * @param user
     * @return
     */
    @Override
    @Transactional
    public int addUserEmp(User user) {
        return userMapper.addUserEmp(user);
    }

    /**
     * 添加用户员工信息以及角色信息一起添加
     * @param user
     * @param employee
     * @return  code=1 成功  code=1失败  msg=消息
     */
    @Transactional
    @Override
    public Map<String, Object> addEmpByUser(User user, Employee employee,String[] roles) {
        HashMap<String, Object> map = new HashMap<>();
        int code = 0;
        try {
            //1.添加员工
            int empCode = employeeMapper.addEmp(employee);
            if(empCode>0){//员工添加成功
                //添加用户信息
                user.setEmployee(employee);//员工添加成功购将员工的id添加到用户中
                System.out.println("==================================添加员工后的id:"+employee.getEmpId());
                int i = userMapper.addUserEmp(user);
                if(i>0){//用户添加成功
                    //开始添加用户的角色信息
                    for (String role : roles) {//一个一个的角色id
                        int a1 = positionMapper.addRoleandPostion(user.getUserId(), Integer.parseInt(role));//添加用户角色关系表
                        if(a1>0){
                            map.put("msg","用户角色添加成功");
                        }
                        else{
                            map.put("msg","用户角色添加失败");
                        }
                    }
                    code=1;
                }
            }
            if(code==0){
                map.put("code",code);
                map.put("msg","用户添加失败");
                return map;
            }
            map.put("code",code);
            map.put("msg","用户添加成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("code",code);
            map.put("msg",e.getMessage());
        }
        return map;
    }


    /**
     * 传入用户id删除以及员工信息
     * @param uid
     * @return code 状态码(0=失败,1=成功) msg 信息
     */
    @Override
    @Transactional
    public Map<String, Object> deleteUserEmpByUid(Integer uid) {
        HashMap<String, Object> map = new HashMap<>();
        try {
            map = new HashMap<>();
            int i = userMapper.deleteUserByUid(uid);
            if(i>0){
                map.put("code",1);
                map.put("msg","success");
            }
            else{
                map.put("code",0);
                map.put("msg","error");
            }
        } catch (Exception e) {
            System.out.println("===============================================员工删除异常");
        }
        return map;
    }

    /**
     * 根据用户id获取用户信息
     * @param uid
     * @return
     */
    @Override
    public User getUserByUidAndEmp(Integer uid) {
        return userMapper.getUserByUidAndEmp(uid);
    }

    /**
     * 修改 用户信息以及员工信息
     * @param user
     * @param employee
     * @return
     */
    @Override
    @Transactional
    public int updateUserAndEmp(User user, Employee employee) {
        return userMapper.updateUserAndEmp(user,employee);
    }

    /**
     * 修改 用户信息以及员工信息
     * @param user
     * @param employee
     * @return 返回结果码
     */
    @Transactional
    @Override
    public ResultUtil AdminupdateUserAndEmp(User user, Employee employee) {
        if("".equals(employee.getEmpFiag())||null == employee.getEmpFiag()){
            employee.setEmpFiag(0);
        }
        ResultUtil resultUtil = new ResultUtil();
        int i = 0;
        try {
            i = userMapper.updateUserAndEmp(user, employee);
        } catch (Exception e) {
            resultUtil.setCode(500);
            resultUtil.setMsg("您的操作过于频繁");
            e.printStackTrace();
        }
        if(i>0){
            resultUtil.setCode(1);//成功
            resultUtil.setMsg("修改成功");
        }
        return resultUtil;
    }


    /**
     * 判断用户名是否存在  返回状态信息
     * @param uname
     * @return
     */

    @Override
    public ResultUtil checkAdminName(String uname) {
        User userByName = userMapper.getUserByName(uname);
        ResultUtil result = new ResultUtil();
        if(userByName!=null){
            return new ResultUtil(500,"用户名已存在");
        }
        return new ResultUtil(0);
    }


    /**
     * 管理员批量删除用户员工
     * @param ids
     * @return
     */
    @Override
    public ResultUtil AdminDelUsers(List<Integer> ids){
        int i = userMapper.deleteUsers(ids);
        if(i>0){
            return new ResultUtil(200,"操作成功");
        }
        return new ResultUtil(500,"您的操作过于频繁");
    }
}
