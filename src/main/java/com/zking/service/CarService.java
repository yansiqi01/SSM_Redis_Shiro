package com.zking.service;

import com.zking.model.Car;
import com.zking.model.CarType;
import com.zking.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @ClassName CarService
 * @Author likai
 * @Date
 **/
public interface CarService {
    /**
     * 查询所有的车辆信息
     * @return
     */
    List<Car> getCars(@Param("workNo")String workNo,@Param("carStateId")Integer carStateId);

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
