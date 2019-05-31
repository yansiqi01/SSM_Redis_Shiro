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
<script type="text/javascript" src="js/login.js"></script>
</body>
</html>