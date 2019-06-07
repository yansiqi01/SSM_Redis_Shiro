<%--
  Created by IntelliJ IDEA.
  User: LRL
  Date: 2019/6/2
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=8aiFKs6Gu5ESPsxpPuzfqOsLAXT4yuTq"></script>
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $.ajax({
                url:'/getDeliveryspotNames',
                dataType:'json',
                Type:'post',
                async: false,//这得注意是同步
                success:function(data){
                    //console.log(data);
                    var html="";
                    $.each(data, function(n, value){
                        html+='<option value="'+n+'">'+value+'</option>';
                        //console.log(n+"=="+value)
                    });
                    $('#deliveryspot').html(html);
                }
            });
        });
    </script>
</head>
<body>
<!--隐藏百度地图,用来获取输入的距离-->
<div id="allmap" style="display: none;"></div>

<form class="layui-form" action="" name="tab">
    <div class="layui-form-item">
        <label class="layui-form-label">起始站</label>
        <div class="layui-input-inline">
            <input id="begin" type="text" name="lineName"  required  lay-verify="required" placeholder="起始站" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">终点站</label>
        <div class="layui-input-inline">
            <input id="end" type="text" name="lineName"  required  lay-verify="required" placeholder="终点站" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属配送点</label>
        <div class="layui-input-inline">
            <select  id="deliveryspot" name="deliveryspot" lay-verify="required">
            </select>
        </div>
        <label class="layui-form-label">线路里程</label>
        <div class="layui-input-inline">
            <input id="lineTH" type="text" name="lineTH" readonly="readonly" maxlength="4"   onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" required lay-verify="required" placeholder="请输入线路里程   " autocomplete="off" class="layui-input">
        </div>
    </div>

    <%--<div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea name="carRemark" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>--%>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="submit" class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script src="layui/layui.js" charset="utf-8"></script>
<script>
    //获取发货地址以及收获地址直接距离
    function instance(city1, city2) {
        var myGeocoder = new BMap.Geocoder();
        myGeocoder.getPoint(city1, function (point1) {
            myGeocoder.getPoint(city2, function (point2) {
                var map = new BMap.Map('allmap');
                map.centerAndZoom("北京", 12);
                var distance = map.getDistance(point1, point2);
                var distanceBuf = (distance / 1000).toFixed(2).split(
                    ".");
                var mileage;
                if (isNaN(distance)) {
                    mileage = "未知";
                } else {
                    var a = 7;
                    a = a + parseInt(distanceBuf[0]);
                    mileage = a + "." + distanceBuf[1];
                }
                $("#lineTH").val(mileage);
            }, city2);
        }, city1);
    };
    $("#end").blur(function () {
       var begin =  $("#begin").val();
       var end =  $("#end").val();
       instance(begin,end);
    })

</script>
<script type="text/javascript">
    layui.use('form', function(){
        var form = layui.form;
        var layer = parent.layer;
        form.on('submit(formDemo)', function(data){
            //console.log("进入提交");
            $.ajax({
                url:'/addLine',
                type:'post',
                dataType:'json',
                data:{
                    "begin":$("#begin").val(),
                    "end":$("#end").val(),
                    "lineTH":$("#lineTH").val(),
                    "deliveryspot":$("#deliveryspot").val(),
                },
                success:function(data){
                    if(data>0){
                        layer.msg("增加成功");
                    }
                },
                error:function(data){
                    layer.msg("太垃圾了");
                }
            });
            setTimeout(function(){
                // layer.msg(msg);
                layer.closeAll("iframe");
                //刷新父页面
                parent.location.reload();
            },1000);
            return false;
        });

    });
</script>
<script>
    layui.use([ 'layer', 'jquery', 'form'], function() {


        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;


    });
</script>
</body>
</html>
