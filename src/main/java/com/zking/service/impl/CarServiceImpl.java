package com.zking.service.impl;

import com.zking.dao.CarMapper;
import com.zking.model.Car;
import com.zking.model.CarType;
import com.zking.service.CarService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("carService")
public class CarServiceImpl implements CarService {

    @Resource
    private CarMapper carMapper;


    @Override
    public List<Car> getCars(String workNo,Integer carStateId) {
        return carMapper.getCars(workNo,carStateId);
    }

    @Override
    public List<CarType> getCarTypes() {
        return carMapper.getCarTypes();
    }

    @Override
    public int updateCarState(Integer carId) {
        return carMapper.updateCarState(carId);
    }

    @Override
    public int addCar(Car car) {
        return carMapper.addCar(car);
    }
}
