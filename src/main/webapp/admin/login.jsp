<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>登录--后台管理</title>
    <link rel="stylesheet" href="layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="css/login.css" media="all" />
    <script>
        var ctx = "${ctx}";
    </script>
    <script type="text/javascript">
        if(window !=top){
            top.location.href=location.href;
        }
    </script>
    <style type="text/css">
        body {
            height: 100%;width: 100%;
            background: url('images/background.jpg');
            background-size:cover;
        }
    </style>
</head>
<body>


<div class="video_mask"></div>
<div class="login">
    <h1>管理员登录</h1>
    <form class="layui-form" id="form">
        <div class="layui-form-item">
            <input class="layui-input" name="userName" placeholder="用户名" value="" lay-verify="required" type="text" autocomplete="off">
        </div>
        <div class="layui-form-item">
            <input class="layui-input" name="userPassword" placeholder="密码" value=""  lay-verify="required" type="password" autocomplete="off">
        </div>
        <button class="layui-btn login_btn" lay-submit="" lay-filter="login" id="btn">登录</button>
    </form>
</div>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form', 'layer'], function () {
        var form = layui.form,
            layer = parent.layer === undefined ? layui.layer : parent.layer,
            $ = layui.jquery;

        /*layer.alert('测试账号：admin 密码：123456', {
              skin: 'layui-layer-molv' //样式类名
              ,closeBtn: 0,
              offset: 't',
              anim: 6
            })*/


        //登录按钮事件
        form.on("submit(login)", function (data) {
            $.ajax({
                type: "POST",
                url: "/admin/adminLogin",
                data:$("#form").serialize(),
                success: function (json) {
                    var result = $.parseJSON(json);
                    console.log("响应："+result);
                    if (result.code == 0) {//登录成功
                        parent.location.href = '/admin/index.jsp';
                    } else{
                        layer.msg(result.msg, {icon: 5});
                    }
                }
            });
            return false;
        })
    });

</script>
</body>
</html>