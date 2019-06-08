package com.zking.service.impl;

import com.zking.dao.CarMapper;
import com.zking.model.Car;
import com.zking.model.CarType;
import com.zking.model.Employee;
import com.zking.service.CarService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Set;


@Service("carService")
public class CarServiceImpl implements CarService {


    @Resource
    private CarMapper carMapper;

    /**
     * 获取车类型
     * @return
     */
    @Override
    public Set<CarType> getCarType() {
        return carMapper.getCarType();
    }

    /**
     * 获取所有员工
     * @return
     */
    @Override
    public Set<Employee> getEmp() {
        return carMapper.getEmp();
    }

    /**
     * 增加车辆
     * @param car
     * @return
     */
    @Override
    public int addCar(Car car) {
        return carMapper.addCar(car);
    }

    /**
     * 获取当前站点的车辆
     * @param car
     * @return
     */
    @Override
    public Set<Car> getAllCar(Car car) {
        return carMapper.getAllCar(car);
    }

    /**
     * 获取所有得车辆名字
     * @return
     */

    @Override
    public Set<Car> getAllCarName() {
        return carMapper.getAllCarName();
    }


    /**
     * 删除车辆
     * @param car
     * @return
     */

    @Override
    public int deleteCar(Car car) {
        return carMapper.deleteCar(car);
    }

    @Override
    public int updateCar(Car car) {
        return carMapper.updateCar(car);
    }
}
