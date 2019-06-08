package com.zking.dao;

import com.zking.model.Car;
import com.zking.model.CarType;
import com.zking.model.Employee;
import org.springframework.stereotype.Service;
import java.util.Set;


@Service("carMapper")
public interface CarMapper {

    /**
     * 获取车类型
     * @return
     */
   Set<CarType> getCarType();

    /**
     * 获取所有员工
     */
    Set<Employee> getEmp();

    /**
     * 增加车辆
     */
    int addCar(Car car);

    /**
     * 查询所有车辆
     */
    Set<Car> getAllCar(Car car);


    /**
     * 获取所有得车辆名字
     * @return
     */
    Set<Car>getAllCarName();

    /**
     * 删除车辆
     */
    int deleteCar(Car car);

    /**
     * 修改车辆
     * @param car
     * @return
     */


    int updateCar(Car car);

}
