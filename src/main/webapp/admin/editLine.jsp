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
    <script type="text/javascript">
        //父页面传值
        function child(data){
            //alert(data.deliveryspotId+data.deliveryspotName);
        }
        $(function(){
            $.ajax({
                url:'/getDeliveryspotNames',
                dataType:'json',
                Type:'post',
                async: false,//这得注意是同步
                success:function(data){
                    //console.log(data);
                    var html="";
                    if(data.deliveryspotId!=null){
                        html+='<option value="'+data.deliveryspotId+'">'+data.deliveryspotName+'</option>';
                    }
                    else{
                        $.each(data, function(n, value){
                            html+='<option value="'+n+'">'+value+'</option>';
                            //console.log(n+"=="+value)
                        });
                    }
                    $('#deliveryspot').html(html);
                }
            });
        });
    </script>
</head>
<body id="body">
<form class="layui-form" action="" name="tab">
    <%--隐藏线路ID--%>
    <input type="hidden" id="lineID" value="">
    <div class="layui-form-item">
        <label class="layui-form-label">起始站</label>
        <div class="layui-input-inline">
            <input id="begin" type="text" name="lineName" value=""  required  lay-verify="required" placeholder="起始站" autocomplete="off" class="layui-input">
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
            <input id="lineTH" type="text" name="lineTH" maxlength="4" value=""   onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" required lay-verify="required" placeholder="请输入线路里程   " autocomplete="off" class="layui-input">
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
<script type="text/javascript">
    layui.use('form', function(){
        var form = layui.form;
        var layer = parent.layer;
        form.on('submit(formDemo)', function(data){
            //console.log("进入提交");
            $.ajax({
                url:'/editLineAndLinetaile',
                type:'post',
                dataType:'json',
                data:{
                    "lineID":$("#lineID").val(),
                    "begin":$("#begin").val(),
                    "end":$("#end").val(),
                    "lineTH":$("#lineTH").val(),
                    "deliveryspotId":$("#deliveryspot").val(),
                },
                success:function(data){
                    if(data>0){
                        layer.msg("修改成功");
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
