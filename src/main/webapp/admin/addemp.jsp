<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="layui/css/layui.css" media="all" />
    <script type="text/javascript" src="layui/layui.js"></script>
</head>
<body>
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">员工账户名</label>
        <div class="layui-input-inline">
            <input type="text" id="userName" name="userName" lay-verify="required" autocomplete="off" placeholder="员工登录账户" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">登录密码</label>
        <div class="layui-input-inline">
            <input type="password" name="userPassword" lay-verify="required" placeholder="登录密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">员工姓名</label>
        <div class="layui-input-inline">
            <input type="text" name="empName" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">员工性别</label>
        <div class="layui-input-inline">
            <input type="radio" name="empSex" value="男" title="男" checked="">
            <input type="radio" name="empSex" value="女" title="女">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">员工地址</label>
        <div class="layui-input-inline">
            <input type="text" name="empAddress" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">员工电话</label>
        <div class="layui-input-inline">
            <input type="text" name="empTel" lay-verify="phone" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">入职时间</label>
            <div class="layui-input-inline">
                <input type="text" name="empWorkTime" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">员工工资</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" lay-verify="number" name="empSalary" placeholder="￥" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">员工身份证</label>
        <div class="layui-input-inline">
            <input type="text" name="empCardId" lay-verify="identity" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>

    <span style="color: red;font-size: 12px;margin-left: 50px" >员工角色选择之后无法修改</span>
    <div class="layui-form-item">
        <label class="layui-form-label">员工角色</label>
        <div class="layui-input-block">
            <select name="rolesid" xm-select="select14_2">
                <c:forEach items="${roles}" var="r">
                    <option value="${r.positionId}">${r.positionName}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">所属配送点</label>
            <div class="layui-input-inline">
                <select name="deliveryspot.deliveryspotId" lay-verify="required" lay-search="">
                    <option value="">直接选择或搜索选择</option>
                    <c:forEach items="${deliverys}" var="d">
                        <option value="${d.deliveryspotId}">${d.deliveryspotName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">任职状态</label>
        <div class="layui-input-block">
            <input type="checkbox" checked="" name="EmpFiag" lay-skin="switch" value="1" lay-filter="switchTest" lay-text="在职|待职">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
    <script type="text/javascript" src="js/addEmp.js" charset="utf-8"></script>
</form>
</body>
<!-- 引入样式 -->
<link rel="stylesheet" type="text/css" href="layui-formSelects/dist/formSelects-v4.css"/>
<!-- 引入jquery依赖 -->
<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<!-- 引入组件 -->
<script src="layui-formSelects/dist/formSelects-v4.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
   $(function () {
       /**
        * 判断用户名不能重复
        */
       $("#userName").blur(function(){
           $.ajax({
               type: "get",
               url: "/admin/checkAdminName?uname="+$("#userName").val(),
               success:function(data){
                   if(data.code!=0){
                       top.layer.msg(data.msg);
                       $("#userName").val("");
                       $("#userName").focus();
                   }
               }
           });
       });
   })
</script>
</html>
