package com.zking.controller;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zking.model.Car;
import com.zking.model.CarType;
import com.zking.model.Deliveryspot;
import com.zking.model.Employee;
import com.zking.service.CarService;
import lombok.val;
import org.apache.http.HttpResponse;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@Controller
public class CarController  {
    Date date = new Date();
    SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
    @Autowired
    private CarService carService;

    @Autowired
    private  CarType carType;
    @Autowired
    private Car car;
    @Autowired
    private Employee employee;

    @Autowired
    private Deliveryspot deliveryspot;

    @RequestMapping("/getCarTyp")
    @ResponseBody
     public Map<String, Object> getCartype(){
        Map<String,Object> maps =  new HashMap<>();
        Set<CarType> data = carService.getCarType();
        Set<Employee> emp = carService.getEmp();
        for (CarType datum : data) {
            System.out.println("=============="+datum);
        }
        maps.put("data",data);
        maps.put("emp",emp);
        return maps;
    }

    @RequestMapping(value = "/addCar",method = RequestMethod.POST)
    public void addCar(HttpServletResponse response, HttpServletRequest request) throws IOException {
        car.setCorkNo(request.getParameter("corkNo"));
        carType.setCarTypeId(Integer.parseInt(request.getParameter("carType")));
        car.setCarSize(Double.parseDouble(request.getParameter("carSize")));
        car.setCarTonnage(Double.parseDouble(request.getParameter("carTonnage")));
        employee.setEmpId(Integer.parseInt(request.getParameter("employee")));
        car.setEmployee(employee);
        car.setCarRemark(request.getParameter("carRemark"));
        car.setCarType(carType);
        car.setCuyTiem(dateFormat.format(date));
        car.setCarstateId(1);
        int i = carService.addCar(car);
        PrintWriter writer = response.getWriter();
        if(i>0){
            writer.print(1);
        }
        else {
            writer.print(0);
        }
        writer.flush();
        writer.close();
    }

    @RequestMapping(value = "/getCarBydeliveryspotId")
    @ResponseBody
    public Map<String,Object> getCarBydeliveryspotId(@Param("page") int page,@Param("limit") int limit,HttpServletRequest request){
        System.out.println("名字====="+request.getParameter("search"));
        String carName = request.getParameter("search");
        Page<Car> objects = PageHelper.startPage(page, limit);
        deliveryspot.setDeliveryspotId(1);
        car.setCorkNo(carName);
        car.setDeliveryspot(deliveryspot);
        System.out.println("car======"+car);
        Set<Car> allCar = carService.getAllCar(car);
        Map<String,Object> maps = new HashMap<>();
        maps.put("code",0);
        maps.put("count",objects.getTotal());
        maps.put("data",allCar);
        return  maps;
    }

    @RequestMapping(value = "/deleteCar",method = RequestMethod.GET)
    public void delOrder( Car car ,HttpServletResponse response) throws IOException {
        int i =carService.deleteCar(car);
        System.out.println("i========="+i);
        PrintWriter writer = response.getWriter();
        if(i>0){
           writer.print(200);
           writer.flush();
           writer.close();
       }

    }
    @RequestMapping("/getCarName")
    @ResponseBody
    public Map<String,Object> getCarName(){
        Map<String,Object> maps = new HashMap<>();
        Set<Car> allCarName = carService.getAllCarName();
        maps.put("data",allCarName);
        return  maps;
    }

    @RequestMapping("/updateCar")
    public void updateCar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("===进了update方法");
        car.setCarId(Integer.parseInt(request.getParameter("carId")));
        car.setCorkNo(request.getParameter("corkNo"));
        carType.setCarTypeId(Integer.parseInt(request.getParameter("carType")));
        car.setCarSize(Double.parseDouble(request.getParameter("carSize")));
        car.setCarTonnage(Double.parseDouble(request.getParameter("carTonnage")));
        employee.setEmpId(Integer.parseInt(request.getParameter("employee")));
        car.setEmployee(employee);
        car.setCarRemark(request.getParameter("carRemark"));
        car.setCarType(carType);
        car.setCuyTiem(dateFormat.format(date));
        car.setCarstateId(1);
        int i = carService.updateCar(car);
        PrintWriter writer = response.getWriter();
        if(i>0){
            writer.print(1);
        }
        else {
            writer.print(0);
        }
        writer.flush();
        writer.close();

    }

}
