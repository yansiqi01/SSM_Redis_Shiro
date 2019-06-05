<%--
  Created by IntelliJ IDEA.
  User: LRL
  Date: 2019/6/2
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
    <script type="text/javascript">
        $(function(){
            $.ajax({
                url:'/getCarTyp',
                dataType:'text',
                Type:'get',
                async:false,
                success:function(data){
                    var html="";
                    var sb="";
                    var str = JSON.parse(data);
                    $.each(str.data, function(n, value){
                    html+='<option value="'+value.carTypeId+'">'+value.carTypeName+'</option>';
                    console.log(value)
                    });
                    $.each(str.emp,function(index,item){
                    sb+='<option value="'+item.empId+'">'+item.empName+'</option>';
                    console.log(item)
                    })
                    $('#cartype').html(html);
                    $('#yuangong').html(sb);
                }
            });
        });
    </script>
</head>
<body>
<form class="layui-form" action="" name="tab">
    <div class="layui-form-item">
        <label class="layui-form-label">输入框</label>
        <div class="layui-input-block">
            <input type="text" name="corkNo" required  lay-verify="required" placeholder="请输入车牌号" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">车容量</label>
        <div class="layui-input-inline">
            <input type="text" name="carSize" required lay-verify="required" placeholder="请输入车容量" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">吨位</label>
        <div class="layui-input-inline">
            <input type="text" name="carTonnage" required lay-verify="required" placeholder="请输入车容量" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选择车辆类型</label>
        <div class="layui-input-block" >
            <select  id="cartype" name="carType" lay-verify="required">

            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">分配员工</label>
        <div class="layui-input-block">
            <select id="yuangong" name="employee" lay-verify="required">
            </select>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea name="carRemark" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
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
            $.ajax({
                url:'${pageContext.request.contextPath}/addCar',
                type:'post',
                dataType:'json',
                data:{"corkNo":data.field.corkNo,"carType":data.field.carType,"carSize":data.field.carSize,"carTonnage":data.field.carTonnage,"employee":data.field.employee,"carRemark":data.field.carRemark},
                success:function(d){
                    if(1>0){
                        layer.msg("增加成功");
                    }
                },
                error:function(){
                    layer.msg("太垃圾了");
                }
            });
            setTimeout(function(){
                // layer.msg(msg);
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
