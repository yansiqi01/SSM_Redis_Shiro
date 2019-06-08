<%--
  Created by IntelliJ IDEA.
  User: LRL
  Date: 2019/6/2
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>车辆管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
</head>
<body>
<div style="margin-bottom: 5px;">
    <!-- 示例-970 -->
    <ins class="adsbygoogle" style="display:inline-block;width:970px;height:90px" data-ad-client="ca-pub-6111334333458862" data-ad-slot="3820120620"></ins>

</div>

<div class="layui-btn-group demoTable">
    <button class="layui-btn" data-type="getCheckLength">给订单派车</button>
    <button class="layui-btn" data-type="isAll">增加车辆</button>
</div>

<table class="layui-table" lay-data="{width:1888, url:'/getCarBydeliveryspotId', page:true, id:'idTest'}" lay-filter="demo">
    <thead>
    <tr>
        <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
        <th lay-data="{field:'carId',  sort: true, fixed: true}">车ID</th>
        <th lay-data="{field:'corkNo',}">车牌号</th>
        <th lay-data="{field:'carSize',}">车容量</th>
        <th lay-data="{field:'cuyTiem',}">购车时间</th>
        <th lay-data="{field:'carTonnage', }">车吨位</th>
        <th lay-data="{field:'carstateId',templet: '#sdata'}">状态</th>
        <th lay-data="{field:'carRemark',}">备注</th>
        <th lay-data="{fixed: 'right', height:600, with:250, align:'center', toolbar: '#barDemo'}"></th>
    </tr>
    </thead>
</table>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delCar">删除</a>
</script>


<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    var json;
    layui.use('table', function(){
        var table = layui.table;
        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.msg('ID：'+ data.id + ' 的查看操作');
            } else if(obj.event === 'delCar'){
                layer.confirm('真的删除行么', function(index){
                    if(data.carstateId==2){
                        layer.msg("对不起,该车辆正在运输状态无法进行删除",{icon:6});
                        return false;
                    }
                    $.ajax({
                        url:'/deleteCar?carId='+data.carId+'',
                        method:'get',
                        success:function(date){
                            if(date==200){
                                obj.del();
                                layer.close(index);
                                layer.msg("删除成功",{icon:6});
                            }
                            else{
                                layer.msg("删除失败",{icon:5})
                            }
                        }
                    });
                });
            } else if(obj.event === 'edit'){
                json = JSON.stringify(data);
                layer.open({
                    type:2,
                    title:"修改车辆",
                    closeBtn: 1,
                    skin: 'layui-layer-rim',
                    closeBtn: true,
                    shift: 2,
                    area: ['700px', '600px'],
                    shadeClose: true,
                    btnAlign: 'c',
                    content:'EditCar.jsp',
                    success:function(layero,index){
                        var body = layer.getChildFrame("body",index);
                        body.find('#CarNo').val(data.corkNo);
                        body.find('#CarRongliang').val(data.carSize);
                        body.find('#carTon').val(data.carTonnage);
                        body.find('#carType').val(data.carType);
                        body.find('employee').val(data.employee);
                        body.find('#carRemark').val(data.carRemark);
                    }
                });
                //
            }
        });
        var $ = layui.$, active = {
            getCheckData: function(){ //获取选中数据
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            }
            ,getCheckLength: function(){ //获取选中数目
                location.href='Order.jsp'
            }
            ,isAll: function(){ //增加
                var open= layer.open({
                    type: 2,
                    title:"新增车辆",
                    closeBtn: 1,
                    skin: 'layui-layer-rim',
                    closeBtn: true,
                    shift: 2,
                    area: ['700px', '600px'],
                    shadeClose: true,
                    btnAlign: 'c',
                    content:'addCar.jsp',
                });

            }
        };
        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>
<script type="text/html" id="sdata">
    {{#if (d.carstateId == 1) { }}
    <span>空闲</span>
    {{# }else if(d.carstateId == 2){ }}
    <span>运输</span>
    {{# } }}
</script>
</body>
</html>
