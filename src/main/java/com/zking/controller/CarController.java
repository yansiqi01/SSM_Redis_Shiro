package com.zking.controller;

import com.zking.model.Car;
import com.zking.model.CarType;
import com.zking.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @ClassName CarController
 * @Author likai
 * @Date
 **/
@Controller
public class CarController {

    @Autowired
    private CarService carService;


    /**
     * 得到所有的车辆信息 或者根据车牌号查询
     * 根据车辆状态查询
     * shuttleBusSet.html绑定数据
     * @return
     */
    @RequestMapping("/getCars")
    @ResponseBody
    public List<Car> getCars(){
        //从前台接受
        String workNo = "6";
        List<Car> cars = carService.getCars(workNo,1);
        for (Car car : cars) {
            System.out.println(car);
        }
        return cars;
    }

    /**
     * 得到所有的车辆类型，供添加车辆时选择车辆类型
     * @return
     */
    @RequestMapping("/getCarTypes")
    @ResponseBody
    List<CarType> getCarTypes(){
        List<CarType> carTypes = carService.getCarTypes();
        for (CarType carType : carTypes) {
            System.out.println(carType);
        }
        return carTypes;
    }

}
