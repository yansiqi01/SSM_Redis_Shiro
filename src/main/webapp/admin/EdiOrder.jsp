<%--
  Created by IntelliJ IDEA.
  User: LRL
  Date: 2019/6/5
  Time: 1:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
    <script type="text/javascript">
        $(function(){
            $.ajax({
                url:"/getCarName",
                dataType:'text',
                Type:'get',
                async:false,
                success:function(carName){
                    var html="";
                    var str = JSON.parse(carName);
                    $.each(str.data, function(n, value){
                        if(value.carstateId==1){
                            html+='<option value="'+value.carId+'">'+value.corkNo+'    (空闲状态)</option>';
                        }
                        if(value.carstateId==2){
                            html+='<option value="'+value.carId+'">'+value.corkNo+'  (运输状态)</option>';
                        }

                    });
                    $("#carName").html(html)
            },
                error:function(){
                    layer.msg('太垃圾了');
                }
            })
        });
    </script>
</head>
<body>
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">选择框</label>
        <div class="layui-input-block">
            <select  id="carName" name="car" lay-verify="required">

            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">派送车辆</button>
            <button type="reset" class="layui-btn layui-btn-primary" >重置</button>
        </div>
    </div>
</form>
<script src="layui/layui.js" charset="utf-8"></script>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;
        var layer = parent.layer;
        form.on('submit(formDemo)', function(data){
            var parent_json = eval('('+parent.json+')');
            $.ajax({
                url:'/sendOrder',
                type:'post',
                dataType:'json',
                data:{"carId":data.field.car,"orderId":parent_json.orderId},
                success:function(d){
                    if(d>0){
                        layer.msg("派送成功");
                    }
                },
                error:function(){
                    layer.msg("太垃圾了");
                }
            })
            setTimeout(function(){
                layer.closeAll("iframe");
                //刷新父页面
                parent.location.reload();
            },2000);
            return false;
        });
    });
</script>
</body>
</html>
