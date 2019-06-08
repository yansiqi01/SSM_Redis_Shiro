<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="demoTable">
    搜索：
    <div class="layui-inline">
        <input class="layui-input" name="search" id="demoReload" autocomplete="off">
    </div>
    <button class="layui-btn" id="search" data-type="reload">搜索</button>
</div>
<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">删除所选</button>
        <button class="layui-btn layui-btn-sm" lay-event="addemp">添加员工</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<link rel="stylesheet" href="layui/css/layui.css" />
<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    layui.use('table', function(){
        var table = layui.table;
        var $ = layui.jquery;

        table.render({
            elem: '#test'
            ,url:'/admin/getUsers'
            ,toolbar: '#toolbarDemo'
            ,title: '用户数据表'
            ,id:"tableReload"
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'userId', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
                ,{field:'userName', title:'用户名', width:120, edit: 'text'}
                ,{field:'userPassword', title:'密码', width:150, edit: 'text', templet: function(res){
                        return '<em>'+ res.userPassword +'</em>'
                    }}
                ,{field:'EmpSex', title:'性别', width:80, sort: true}
                ,{field:'EmpName', title:'员工姓名', width:100}
                ,{field:'EmpAddress', title:'员工地址',width:100}
                ,{field:'EmpTel', title:'员工电话', width:120, sort: true}
                ,{field:'EmpSalary', title:'员工工资', width:150,sort:true}
                ,{field:'EmpWorkTime', title:'入职时间', width:220,sort: true}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
            ,page: true
        });

        $("#search").on('click', function(){
            //执行重载
            table.reload('tableReload', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    search:$('#demoReload').val()
                }
            });
        });

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    if(data.length==0){
                        layer.msg("请选择")
                        break;
                    }
                    layer.confirm('你确定要删除这'+data.length+'个员工吗？', {
                        btn: ['确认','取消'] //按钮
                    }, function(){
                        var ids=[];
                        for (var i=0;i<data.length;i++){
                            ids.push(data[i].userId);
                        }
                        $.ajax({
                            type:"post",
                            url:"/admin/dels",
                            data:{
                                ids : ids
                            },
                            dataType:"json",
                            success:function (json) {
                                // alert("结果码:"+json.code);
                                if(json.code==200){
                                    layer.msg(json.msg);
                                    table.reload('tableReload', {
                                        url: '/admin/getUsers'
                                    });
                                }
                                else if (json.code==500) {
                                    layer.msg(json.msg);
                                }
                            }
                        });
                    });

                    // layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;
                case 'addemp':
                    layer.open({
                        type: 2,
                        title: '添加员工',
                        shadeClose: true,
                        shade: 0.3,
                        area: ['70%', '70%'],
                        content: '/admin/getTreeRole' //iframe的url
                    })
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            var userId = data.userId;
            // console.log(data.userId);
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    // layer.alert("uid:"+userId);
                    $.ajax({
                        type:"post",
                        url:"/admin/delUseremp?uid="+userId,
                        dataType:"json",
                        success:function (json) {
                            // alert("结果码:"+json.code);
                            if(json.code>0){
                                obj.del();
                                layer.msg("操作成功");
                            }
                            else if (json.code==0) {
                                layer.msg("您的操作过于频繁");
                            }
                        }
                    });
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.open({
                    type: 2,
                    title: '编辑员工',
                    shadeClose: true,
                    shade: 0.5,
                    area: ['30%', '70%'],
                    content: '/admin/preeditemp?uid='+userId //iframe的url
                })
            }
        });
    });

</script>

</body>
</html>
