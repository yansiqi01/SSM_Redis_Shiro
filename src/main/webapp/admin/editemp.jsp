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
    <%--隐藏用户id--%>
    <input type="hidden" name="userId" value="${user.userId}"/>
    <div class="layui-form-item">
        <label class="layui-form-label">员工账户名</label>
        <div class="layui-input-inline">
            <input type="text" name="userName" lay-verify="title" value="${user.userName}" autocomplete="off" placeholder="员工登录账户" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">登录密码</label>
        <div class="layui-input-inline">
            <input type="text" name="userPassword" lay-verify="required" value="${user.userPassword}" placeholder="登录密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">员工姓名</label>
        <div class="layui-input-inline">
            <input type="text" name="EmpName" lay-verify="required" value="${user.employee.empName}" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">员工性别</label>
        <div class="layui-input-inline">
            <c:if test="${user.employee.empSex=='男'}">
                 <input type="radio" name="EmpSex" value="男" title="男" checked="" >
                <input type="radio" name="EmpSex" value="女" title="女">
            </c:if>
            <c:if test="${user.employee.empSex=='女'}">
                <input type="radio" name="EmpSex" value="男" title="男">
                <input type="radio" name="EmpSex" value="女" title="女" checked="">
            </c:if>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">员工地址</label>
        <div class="layui-input-inline">
            <input type="text" name="EmpAddress" lay-verify="required" value="${user.employee.empAddress}" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">员工电话</label>
        <div class="layui-input-inline">
            <input type="text" name="EmpTel" lay-verify="required" placeholder="请输入" value="${user.employee.empTel}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">入职时间</label>
            <div class="layui-input-inline">
                <input type="text" name="EmpWorkTime" id="date" lay-verify="date" placeholder="yyyy-MM-dd" value="${user.employee.empWorkTime}" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">员工工资</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" name="EmpSalary" placeholder="￥" autocomplete="off" value="${user.employee.empSalary}" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">员工身份证</label>
        <div class="layui-input-inline">
            <input type="text" name="EmpCardId" lay-verify="required" placeholder="请输入" value="${user.employee.empCardId}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <!-- 隐式标签 -->
    <c:forEach items="${userRole }" var="ur">
        <input type="hidden" name="roles" value="${ur.positionId }"/>
    </c:forEach>
    <div class="layui-form-item">
        <label class="layui-form-label">员工角色</label>
        <div class="layui-input-block">
            <select name="rolesid" xm-select="select14_2">
                <c:forEach items="${roles}" var="r">
                    <%--<c:forEach items="${userRole}" var="ur">
                        &lt;%&ndash;<c:if test="${exitId eq '0'}">
                            <c:if test="${ur.positionId==r.positionId}">
                                <option value="${r.positionId}" selected="selected">${r.positionName}</option>
                                <c:set var="exitId" value="1"/>&lt;%&ndash;终止循环&ndash;%&gt;
                            </c:if>
                        </c:if>&ndash;%&gt;
                        <c:set var="exitId" value="${ur.positionId}"/>
                    </c:forEach>--%>
                    <%--<c:if test="${r.positionId==exitId}">
                        <option value="${r.positionId}" selected="selected">${r.positionName}</option>
                    </c:if>
                    <c:if test="${r.positionId!=exitId}">

                    </c:if>--%>
                    <option value="${r.positionId}" id="${r.positionId}">${r.positionName}</option>
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
                        <c:if test="${user.deliveryspot.deliveryspotId==d.deliveryspotId}">
                            <option value="${d.deliveryspotId}" selected>${d.deliveryspotName}</option>
                        </c:if>
                        <c:if test="${user.deliveryspot.deliveryspotId!=d.deliveryspotId}">
                            <option value="${d.deliveryspotId}">${d.deliveryspotName}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">任职状态</label>
        <div class="layui-input-block">
            <c:if test="${user.employee.empFiag=='1'}">
                <input type="checkbox" checked="" name="EmpFiag" lay-skin="switch" value="1" lay-filter="switchTest" lay-text="在职|待职">
            </c:if>
            <c:if test="${user.employee.empFiag=='0'}">
                <input type="checkbox"  name="EmpFiag" lay-skin="switch" value="1" lay-filter="switchTest" lay-text="在职|待职">
            </c:if>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
    <script type="text/javascript" src="js/editEmp.js"></script>
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
        //选中下拉框
        mychecked();
    })
    //进入页面
    //获取该用户的角色id  并且让其选上   渲染
    function mychecked(){
        var sa = $("input[name='roles']");//id
        for(var i=0;i<sa.length;i++){
            // alert(sa[i].value);
            $("rolesid option[id="+sa[i].value+"]");
            // var select = document.getElementsByName('rolesid');
            // var option = select.getElementsByTagName('option');
            // // $("select option[id=2]").attr("selected","selected");
            // console.log(option.value);
        }
        console.log($("rolesid option"));
    }

</script>
</html>
