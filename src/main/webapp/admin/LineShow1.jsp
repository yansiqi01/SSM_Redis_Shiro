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
    <button class="layui-btn layui-btn-sm" lay-event="addLine">添加线路</button>
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
            ,url:'/getLines'
            ,toolbar: '#toolbarDemo'
            ,title: '线路及基本信息表'
            ,id:"tableReload"
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'LineId', title:'序号', fixed: 'left', unresize: true, sort: true}
                ,{field:'LineName', title:'线路名称', edit: 'text'}
                ,{field:'LineTh', title:'里程',  edit: 'text', sort:true }
                ,{field:'deliveryspotName', title:'配送点名称' }
                ,{field:'deliveryspotProvince', title:'所在省' }
                ,{field:'deliveryspotCity', title:'所在市'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
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
                case 'addLine':
                    layer.open({
                        type: 2,
                        title:"增加线路",
                        closeBtn: 1,
                        skin: 'layui-layer-rim',
                        closeBtn: true,
                        shift: 2,
                        area: ['700px', '600px'],
                        shadeClose: true,
                        btnAlign: 'c',
                        content:'/admin/addLine.jsp',
                    })
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('真的删除这条线路吗', function(index){
                    $.ajax({
                        url:'/delLine',
                        type:'post',
                        data:{
                            LineId:data.LineId,
                        },
                        success:function () {
                            obj.del();
                        },
                        error:function () {
                            obj.del();
                        }
                    })
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.open({
                    type: 2,
                    title: '修改线路',
                    shadeClose: true,
                    shade: 0.5,
                    area: ['30%', '70%'],
                    content:'/admin/editLine.jsp',
                    success:function (layero,index) {
                        // 获取子页面的iframe
                        var iframe = window['layui-layer-iframe' + index];
                        // 向子页面的全局函数child传参
                        iframe.child(data);

                        var strs = new Array();
                        strs = data.LineName.split("-");
                        var body = layer.getChildFrame("body",index);
                        body.find("#lineID").val(data.LineId);
                        body.find('#begin').val(strs[0]);
                        body.find('#end').val(strs[1]);
                        body.find('#deliveryspot').val(data.deliveryspotId);
                        body.find('#lineTH').val(data.LineTh);
                    }
                })
            }
        });
    });

</script>

</body>
</html>
