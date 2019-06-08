var $;
var form;
layui.use(['form','layer','jquery','laydate'],function(){
    var layer = parent.layer === undefined ? layui.layer : parent.layer,laydate = layui.laydate;
    $ = layui.jquery;
    form = layui.form;
    form.render();
    laydate.render({
        elem: '#date' //指定元素
        ,max: 'new Date()'
    });

    //表单提交
    form.on("submit(demo1)",function(data){
        //弹出loading
        var index =  layer.msg('数据提交中，请稍候');
        var msg;
        $.ajax({
            type: "post",
            url: "/admin/addemp",
            data:data.field,
            dataType:"text",
            success:function(d){
                data = $.parseJSON(d);
                if(data.code==1){
                    layer.msg("添加成功！");
                    // msg="添加成功！";
                }else{
                    // msg=d.msg;
                    layer.msg("您的操作过于频繁！");
                }
            },
            error:function (data) {
                layer.msg("您的操作过于频繁");
            }
        });
        setTimeout(function(){
            layer.close(index);
            // layer.msg(msg);
            layer.closeAll("iframe");
            //刷新父页面
            parent.location.reload();
        },2000);
        return false;
    })

})