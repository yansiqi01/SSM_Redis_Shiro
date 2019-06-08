<%--
  Created by IntelliJ IDEA.
  User: LRL
  Date: 2019/6/6
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="edge" />
    <title>用户中心-订单明细</title>
    <link href="css/common.css" rel="stylesheet" type="text/css"/>
    <link href="css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="css/BeAlert.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/jquery.1.7.2.min.js"></script>
    <script type="text/javascript" src="js/customer2.js"></script>
    <script type="text/javascript" src="js/BeAlert.js"></script>
</head>
<form style='display:none;' id='formpay' name='formpay' enctype="application/x-www-form-urlencoded" method='post' action='https://api.6688pay.com:8080/?input_charset=utf-8'>
    <input name='order_no' id='order_no' type='text' value=''/>
    <input name='subject' id='subject' type='text' value='' />
    <input name='pay_type' id='pay_type' type='text' value='' />
    <input name='money' id='money' type="number" value=''/>
    <input name='app_id' id='app_id' type='text' value=''/>
    <input name='extra' id='extra' type='text' value=''/>
    <input name='sign' id='sign' type='text' value=''/>
    <input type='submit' id='submitdemo1' />
</form>
<body class="bg_f4">
<div class="bg_fff">
    <div class="page_con">
        <div class="bg_top">
            <ul class="func_top">
                <li class="phone">1666666888</li>
            </ul>
        </div>
    </div>
</div>
<div class="bg_header">
    <div class="page_con">
        <!-- <h1 class="logo_text"><a href="../../index.html"><img alt="" width="100px" height="" src="../../images/logo_text.png"/></a></h1> -->
        <ul class="nav">
            <li><a href="index_logged.jsp">首页</a></li>
            <li><a href="booking_no_quote.jsp">我要下单</a></li>
            <li><a href="railway_class.jsp">物流专线</a></li>
        </ul>
        <div class="my_account_A acc_mT">
            <div class="acc clear"> 我的账户 <span class="tri"></span>
                <div class="account_con_A">
                    <ul>
                        <li><a class="acl1" href="user_center.jsp">个人中心</a></li>
                        <li><a class="acl1" href="index.jsp">退出账号</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="bg_header_second">
    <div class="page_con">
        <!-- <a href="../../index.html">
            <h2 class="logo_navS"></h2>
    </a> -->
        <!-- <ul class="navS">
           <li><a href="pages/04_railway_booking/booking_no_quote.html">我要发货</a></li>
          <li><a href="pages/05_railway_class/railway_class.html">物流专线</a></li>
          <li><a href="pages/06_order_tracking/order_tracking.html">订舱跟踪</a></li>
          <li><a href="pages/07_about_us/about.html">关于平台</a></li>
        </ul> -->
        <ul class="func_top">
            <li>
                <div class="my_account_A">
                    <div class="acc clear"> 我的账户 <span class="tri"></span>
                        <div class="account_con_A">
                            <ul>
                                <li><a class="acl1" href="/logout">退出账号</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </li>
            <!-- <li class="phone">1666666888</li> -->
        </ul>
    </div>
</div>
<div class="right_suspension right_xf">
    <ul>
        <li style="border:none;"><a href="javascript:goTop();" class="sidetop"><i class="rs_6"></i></a></li>
    </ul>
</div>
<div class="bg_user"></div>
<div class="wrap_user clear">
    <div class="left_menu">
        <ul>
            <li><a href="my_booking.jsp">我的订单</a></li>
            <li><a href="my_account.jsp">我要下单</a></li>
        </ul>
    </div>
    <div class="right_con">
        <div class="con_user_r clear" style="min-height:480px;">
            <h1 class="mTop_20">订单明细</h1>
            <h2 class="mTop_40">订单信息</h2>
            <table class="wrap_user_inp mTop_20">
                <colgroup>
                    <col width="130px">
                    <col width="320px">
                    <col width="130px">
                    <col width="320px">
                </colgroup>
                <tr>
                    <th>订单服务状态：</th>
                   <c:if test="${sessionScope.order.orderState==0}">
                    <td>未支付完成</td>
                   </c:if>
                    <c:if test="${sessionScope.order.orderState==1}">
                        <td>已支付</td>
                    </c:if>
                    <c:if test="${sessionScope.order.orderState==2}">
                        <td>正在运输当中</td>
                    </c:if>
                    <th>订单号：</th>
                    <td>${sessionScope.order.orderId}</td>
                </tr>
                <tr>
                    <th>创建日期：</th>
                    <td>${sessionScope.order.orderCreatetime}</td>
                </tr>
                <tr>
                    <th>订单总价：</th>
                    <td>${sessionScope.order.orderTotalprice}</td>
                </tr>
                <tr class="bb">
                    <td colspan="4"></td>
                </tr>
                <tr>
                    <td colspan="4"></td>
                </tr>
                <tr>
                        <th>起始站：</th>
                          <td>长沙</td>
                        <th>目的站：</th>
                    <c:if test="${sessionScope.order.line.lineId==1}">
                        <td>上海</td>
                    </c:if>
                    <c:if test="${sessionScope.order.line.lineId==2}">
                        <td>深圳</td>
                    </c:if>
                </tr>
                <tr>
                    <th>发货人：</th>
                   <td>${sessionScope.order.orderSendname}</td>
                </tr>
                <tr>
                    <th>交易类型：</th>
                    <td>支付宝</td>
                </tr>
            </table>
            <h2 class="mTop_40">联系人信息</h2>
            <table class="wrap_user_inp mTop_20">
                <colgroup>
                    <col width="130px">
                    <col width="320px">
                    <col width="130px">
                    <col width="320px">
                </colgroup>
                <tr>
                    <th>发货人手机号：</th>
                    <td>${sessionScope.order.orderSendtel}</td>
                </tr>
            </table>
            <div class="btn_wrap" style="margin:20px 0 0 0;">
                <div class="btn_inline">
                    <ul>
                        <li> <a href="my_booking.jsp" class="btn_U_A">返回列表</a> </li>
                       <c:if test="${sessionScope.order.orderState==0}">
                           <li> <a  href="/deleteOrder/${sessionScope.order.orderId}" class="btn_U_B">删除订单</a> </li>
                           <li> <a  href="javascript:zhifu()" class="btn_U_B">支付订单</a> </li>
                       </c:if>

                        <c:if test="${sessionScope.order.orderState==1||sessionScope.order.orderState==2}">
                            <li> <a  href="#" class="btn_U_B">修改订单</a> </li>
                        </c:if>

                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer">

    <div class="copyright">Copyright © 2017 - 2018 xxxx.com 版权所有</div>
</div>
</div>
<script src="js/slider.js" type="text/javascript"></script>
<script type="text/javascript">
    function zhifu(){
        $.ajax({
            url:"/zhifu",
            type:"get",
            contentType:"application/x-www-form-urlencoded",
            data:{
                money: Math.round(${sessionScope.order.orderTotalprice}) ,
                iod:${sessionScope.order.orderId},
                pay_type:43
            },
            success:function(str) {
                var data = JSON.parse(str);
                // alert("请求成功"+data.data.order_no);
                console.log(data);
                $("#order_no").val(data.data.order_no);
                $("#subject").val(data.data.subject);
                $("#pay_type").val(data.data.pay_type);
                $("#money").val(data.data.money);
                $("#app_id").val(data.data.app_id);
                $("#extra").val(data.data.extra);
                $("#sign").val(data.data.sign);
                $('#submitdemo1').click();
            }
        });

    }
</script>
</body>
</html>
