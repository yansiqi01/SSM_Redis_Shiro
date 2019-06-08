package com.zking.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zking.model.*;
import com.zking.service.OrderService;
import com.zking.util.PayUtil;
import com.zking.util.ResponsUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class OrderController {
    Date date = new Date();
    SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");

    @Autowired
    private Line line;
    @Autowired
    private OrderService orderService;
    @Autowired
    private GoodsType goodsType;

    @Autowired
    private Car car;

    @Autowired
    private Oders oders;
    @Autowired
    private Deliveryspot deliveryspot;


    @Autowired
    private Quser quser;

    @RequestMapping(value = ("/addOrder"),method = RequestMethod.POST)
    public String addOrder(Oders oders, HttpServletRequest request){
    deliveryspot.setDeliveryspotId(1);
    quser = (Quser) request.getSession().getAttribute("QUser");
    deliveryspot.setDeliveryspotId(1);
    goodsType.setGoodsId(Integer.parseInt(request.getParameter("GoodsId")));
    line.setLineId(Integer.parseInt(request.getParameter("LineId")));
    oders.setDeliveryspot(deliveryspot);
    oders.setQuser(quser);
    oders.setGoodsType(goodsType);
    oders.setOrderTotalprice(Double.parseDouble(request.getParameter("mony")));
    oders.setOrderState(0);
    oders.setOrderCreatetime(dateFormat.format(date));
    oders.setLine(line);
    int i = orderService.addOrder(oders);
    if(i>0){
        return "my_booking";
    }
    return  null;

    }

    @RequestMapping(value = "/deleteOrder/{id}",method = RequestMethod.GET)
    public String  delOrder(@PathVariable("id") Integer OrderId, HttpServletResponse response) throws IOException {
        System.out.println("========OrderId"+OrderId);
        oders.setOrderId(OrderId);
        int i = orderService.delOrder(oders);
        if(i>0){
           return "my_booking";
        }
        return  null;
    }


    @RequestMapping(value = "/getOrdersBystate1")
    @ResponseBody
    public Map<String,Object> getOrdersBystate1(@Param("page") int page,@Param("limit") int limit ){
        Page<Oders> objects = PageHelper.startPage(page, limit);
        Set<Oders> orders = orderService.getOrders();
        System.out.println("总页数======"+objects.getTotal());
        Map<String,Object> maps = new HashMap<>();
        maps.put("code",0);
        maps.put("count",objects.getTotal());
        maps.put("data",orders);
        return maps;
    }

    @RequestMapping(value = "/getOrdersByquserId")
     @ResponseBody
    public Map<String,Object> getOrdersByquserId(@Param("page") int page,@Param("pageSize") int pageSize,HttpServletRequest request){
        quser = (Quser)request.getSession().getAttribute("QUser");
        System.out.println("quser======="+quser);
           //quser.setQuserId(1);
        Page<Oders> objects = PageHelper.startPage(page, pageSize);
        Set<Oders> orders = orderService.getOrdersByQserId(quser);
        System.out.println("总页数======"+objects.getTotal());
        Map<String,Object> maps = new HashMap<>();
        maps.put("code",0);
        maps.put("total",objects.getTotal());
        maps.put("rows",orders);
        return maps;
    }
    @RequestMapping(value = "/getOderByorderId")
    public String getOrders(Oders oders,HttpServletRequest request){
        Oders oderByorderId = orderService.getOderByorderId(oders);
        System.out.println("orderID====="+oderByorderId);
        if(null !=oderByorderId){
            request.getSession().setAttribute("order",oderByorderId);
            return "details_booking";
        }
        return  null;
        }

    @RequestMapping(value = "/sendOrder")
    public void sendOrder(@Param("carId") Integer carId,@Param("orderId") Integer orderId, HttpServletResponse response) throws IOException {
        System.out.println("==========进来了");
        System.out.println("carId"+carId+"orderId"+oders.getOrderId());
       car.setCarId(carId);
       oders.setOrderId(orderId);
       oders.setCar(car);
       int n = orderService.sendOrder(oders);
       PrintWriter writer = response.getWriter();
       if(n>0){
           writer.print(n);
       }
           writer.flush();
           writer.close();
    }

    /**
     * 支付功能
     */
    String format="";
    String orderId="";
    @ExceptionHandler
    @RequestMapping("/zhifu")
    public void pay(HttpServletRequest request, HttpServletResponse response,  Float money, int pay_type,@Param("iod") String iod) throws Exception{
        orderId =iod;
        Map<String, Object> resultMap = new HashMap<String, Object>();
        Map<String, Object> remoteMap = new HashMap<String, Object>();
        //格式化价格
        java.text.DecimalFormat   df   =new   java.text.DecimalFormat("#.00");
        format = df.format(money);
        remoteMap.put("money", this.format);
        remoteMap.put("pay_type", pay_type);
        remoteMap.put("order_no", PayUtil.getOrderIdByUUId());
        remoteMap.put("subject", "商品名称");
        remoteMap.put("app_id", PayUtil.APP_ID);
        remoteMap.put("extra", "");
        resultMap.put("data", PayUtil.payOrder(remoteMap));
        System.out.println("返回的数据");
        System.out.println(resultMap);
        //响应数据
        ResponsUtil.printout(response,resultMap);
    }

    @RequestMapping("/notifyPay")
    public void notifyPay(HttpServletRequest request, HttpServletResponse response, PayModel payModel) throws IOException {
        // 保证密钥一致性
       if (PayUtil.checkSign(payModel)) {
            System.out.println("format======="+format);
           System.out.println("钱 ========"+request.getParameter("money"));
            if(Double.parseDouble(format)==Double.parseDouble(request.getParameter("money"))){
                System.out.println("已经等于");
                oders.setOrderId(Integer.parseInt(orderId));
                oders.setOrderState(1);
                int i = orderService.updateOrder(oders);
                if(i>0){
                    System.out.println("修改成功");
                }
            }
        }
         else {
            // 签名错误
            response.getWriter().println("签名错误");
        }
    }

}
