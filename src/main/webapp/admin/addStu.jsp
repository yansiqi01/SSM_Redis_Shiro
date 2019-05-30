<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title></title>
<link rel="stylesheet" href="layui/css/layui.css" />
<script src="layui/layui.js"></script>
<script>
	layui.use('form',function(){
		var from = layui.from;
	});
</script>
</head>
<body>
	<div class="layui-container">
		<form class="layui-form" action="" lay-filter="example">
		<div class="layui-form-item">
			<label class="layui-form-label">学生姓名</label>
			<div class="layui-input-block">
				<input type="text" name="username" lay-verify="title"
					autocomplete="off" placeholder="请输入姓名" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">学生年龄</label>
			<div class="layui-input-block">
				<input type="password" name="password" placeholder="请输入年龄"
					autocomplete="off" class="layui-input">
			</div>
		</div>


		<div class="layui-form-item">
			<label class="layui-form-label">单选框</label>
			<div class="layui-input-block">
				<input type="radio" name="sex" value="男" title="男" checked="">
				<input type="radio" name="sex" value="女" title="女">
			</div>
		</div>
		<div class="layui-form-item"> 
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
			</div>
		</div>
	</form>
	</div>
</body>
</html>
