package com.zking.dao;

import com.zking.model.Car;
import com.zking.model.CarType;
import com.zking.model.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("carMapper")
public interface CarMapper {

    /**
     * 查询所有的车辆信息
     * @return
     */
    List<Car> getCars();

    /**
     * 根据车牌号查询车辆信息
     * @param workNo
     * @return
     */
    Car getCarByWorkNo(String workNo);

    /**
     * 根据车辆状态查询车辆信息
     * @param state
     * @return
     */
    List<Car> getCarsByState(Integer state);

    /**
     * 得到所有的车辆类型，供添加车辆时选择车辆类型
     * @return
     */
    List<CarType> getCarTypes();

    /**
     * 根据车辆ID修改车辆状态
     * @param carId
     * @return
     */
    int updateCarState(Integer carId);

    /**
     * 增加车辆信息
     * @param car
     * @return
     */
    int addCar(Car car);



}
