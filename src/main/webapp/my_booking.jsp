<%--
  Created by IntelliJ IDEA.
  User: LRL
  Date: 2019/6/6
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="edge" />
    <title>用户中心-我的订单</title>
    <link href="css/common.css" rel="stylesheet" type="text/css"/>
    <link href="admin/layui/css/layui.css">
    <link href="css/reset.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.bootcss.com/jquery/2.0.1/jquery.js"></script>
    <script type="text/javascript" src="js/customer2.js"></script>
    <script type="text/javascript" src="admin/layui/layui.js"></script>
    <script type="text/javascript">
        layui.use('laypage',function(){
            var layuipage = layui.laypage;
            var url="/getOrdersByquserId";
            var config = {page:1,pageSize:4};
            $.getJSON(url,config,function(res){
                layuipage.render({
                    elem:'page1',
                    count: 100,
                    first: '首页',
                    last: '尾页',
                    count:res.total,//总页数
                    limit:config.pageSize,//每页条数
                    theme: '#FFB800',
                    jump:function(obj,first){
                        if(!first){
                            config.page = obj.curr;
                            getUserListByPage(url,config);
                        }
                    }
                });
                parseUserList(res,config.page);
            });
            function getUserListByPage(url,config){
                $.getJSON(url,config,function(res){
                    parseUserList(res,config.page);
                });
            }
            function parseUserList(res,currPage){
                var content="";
                content+= " <tr>\n" +
                    " <th>订单服务状态</th>\n" +
                    "<th>订单号</th>\n" +
                    "<th>创建日期</th>\n" +
                    "<th>订单总价</th>\n" +
                    "<th>发货人</th>\n" +
                    "<th>收货人</th>\n" +
                    "<th>操作</th>\n" +
                    "</tr>";
                $.each(res.rows, function (i, o) {
                    content += "<tr>";
                    if(o.orderState==0){
                        content += "<td>未付款</td>";
                    }
                    if(o.orderState==1){
                        content += "<td>已付款</td>";
                    }
                    if(o.orderState==2){
                        content += "<td>运输中</td>";
                    }
                    content += "<td>"+o.orderId+"</td>";
                    content += "<td>"+o.orderCreatetime+"</td>";
                    content += "<td>"+o.orderTotalprice+"</td>";
                    content += "<td>"+o.orderSendname+"</td>";
                    content += "<td>"+o.orderReceivename+"</td>";
                    content += "<td><a href='/getOderByorderId?orderId="+o.orderId+"'>查看详情</a></td>";
                    content += "</tr>";
                });
                $('#tab').html(content);
            }
        });
    </script>
</head>
<body class="bg_f4">
<div class="bg_header">
    <div class="page_con">
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
        <div class="con_user_r clear">
            <h2>我的订单</h2>
            </div>
            <table class="table_U mTop_40" id="tab">
            </table>
           <div id="page1" style="font-size: 18px;align-content: center; margin-left: 400px;"></div>
        </div>
    </div>
</div>
<div class="footer" style="margin-top: 0;">
    <div class="copyright">Copyright © 2017 - 2018 xxxx.com 版权所有</div>
</div>
</div>
<script src="js/slider.js" type="text/javascript"></script>
<script type="text/javascript" src="js/laydate/laydate.js"></script>
<script>
    $(function(){
        //执行多个日历
        lay('.lay_t_item').each(function(){
            laydate.render({
                elem: this
            });
        });
    });

</script>
</body>
</html>

