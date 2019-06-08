<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>订单管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.js"></script>
</head>
<body>
<div style="margin-bottom: 5px;">
    <!-- 示例-970 -->
    <ins class="adsbygoogle" style="display:inline-block;width:970px;height:90px" data-ad-client="ca-pub-6111334333458862" data-ad-slot="3820120620"></ins>
</div>

<div class="layui-btn-group demoTable">
    <button class="layui-btn" data-type="isAll">返回车俩管理</button>
</div>

<table class="layui-table"lay-data="{url:'/getOrdersBystate1', page:true, id:'idTest'}" lay-filter="demo">
    <thead>
    <tr>
        <th lay-data="{type:'checkbox',  fixed: 'left'}"></th>
        <th lay-data="{field:'orderId',  sort: true, fixed: true}">订单ID</th>
        <th lay-data="{field:'orderSendname'}">寄件人姓名</th>
        <th lay-data="{field:'orderSendaddress'}">寄件人地址</th>
        <th lay-data="{field:'orderSendtel'}">收件人电话</th>
        <th lay-data="{field:'orderReceivename'}">收件人姓名</th>
        <th lay-data="{field:'orderReceiveaddress', sort: true}">收件人地址</th>
        <th lay-data="{field:'orderReceivetel'}">收件人电话</th>
        <th lay-data="{field:'orderState',sort: true,templet: '#sdata'}">订单状态</th>
        <th lay-data="{field:'orderTotalprice',  sort: true, fixed: 'right'}">总费用</th>
        <th lay-data="{field:'orderInsureprice',sort: true}">保价费用</th>
        <th lay-data="{field:'orderGoodsprice',sort: true}">物品估价</th>
        <th lay-data="{field:'orderVolume',sort: true}">物品体积</th>
        <th lay-data="{field:'orderWeight',sort: true}">物品重量</th>
        <th lay-data="{field:'orderRemark',sort: true}">备注</th>
        <th lay-data="{field:'orderCreatetime',sort: true}">订单生成时间</th>
        <th lay-data="{fixed: 'right', height:600, with:100, align:'center', toolbar: '#barDemo'}"></th>
    </tr>
    </thead>
</table>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" id="pa">派车</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
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
                json = JSON.stringify(data);
                if(data.orderState==2){
                    layer.msg("该订单已经在派送了,请不要重复操作",{icon:6});
                    return false;
                }
                layer.open({
                    type:2,
                    title:"修改订单",
                    closeBtn: 1,
                    skin: 'layui-layer-rim',
                    closeBtn: true,
                    shift: 2,
                    area: ['400px', '300px'],
                    shadeClose: true,
                    btnAlign: 'c',//按钮居中
                    content:'EdiOrder.jsp',
                });
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                  $.ajax({
                      url:'/deleteOrder/'+data.OrderId+'',
                      method:'get',
                      success:function(date){
                          console.log(date)
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
                layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });
        var $ = layui.$, active = {
            getCheckData: function(){ //获取选中数据
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            }
            ,getCheckLength: function(){ //获取选中数目
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                layer.msg('选中了：'+ data.length + ' 个');
            }
            ,isAll: function(){ //验证是否全选
               location.href='Car.jsp'
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>
<script type="text/html" id="sdata">
    {{#if (d.orderState == 1) { }}
    <span>未发车</span>
    {{# }else if(d.orderState == 2){ }}
    <span>已发车</span>
    {{# } }}
</script>
<a href="/addOrder">增加</a>
</body>
</html>