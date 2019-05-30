<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" href="layui/css/layui.css" />
		<script src="layui/layui.js"></script>
		<script type="text/html" id="barDemo">
          <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
          <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>
		<script>
			layui.use(['table','upload'],function(){
				var table = layui.table;
				var layer = layui.layer;
				var upload = layui.upload;
				var $ = layui.$;
				table.render({ 
					elem: '#test',
					url:'userActiongetAll.action'
					    ,toolbar: '#toolbarDemo'
					    ,title: '用户数据表'
					    ,page: true//开启分页
					    ,limits:[5,10,20,30,40,50,60,70,80,90]
					    ,id:"testReload"
					    ,width:1000 
					    ,cols: [[
					      {type: 'checkbox', fixed: 'left'}
					      ,{field:'sid', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
					      ,{field:'sname', title:'用户名', width:120, edit: 'text'}
					      ,{field:'sex', title:'性别', width:120, edit: 'text', sort: true}
					      ,{field:'sage', title:'年龄', width:100}
					      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
					    ]]
				});
				 
				$('.demoTable .layui-btn').on('click', function(){
					 //执行重载
	                table.reload('testReload', {
	                    page: {
	                        curr: 1 //重新从第 1 页开始 
	                    }
	                    ,where: {
	                        title:$('#demoReload').val()
	                    }
	                });
		        });
				
				$("#addstu").on('click',function(){
					layer.open({ 
						  title:'添加学生',
						  type: 2,
						  area: ['500px', '450px'],
						  fixed: false, //不固定
						  maxmin: true, 
						  content: 'addStu.jsp' 
					}); 
				});   
				
				$("#erport").on('click',function(){
					layer.confirm('确定要导出数据吗？', {
						  btn: ['确认','取消'] //按钮
					}, function(index){
						window.location.href="userActionexport.action";
						layer.close(index);
					}, function(index){ 
						layer.close(index);
						 });
				}); 
				
				$("#erport2").on('click',function(){
					layer.confirm('确定要导出数据吗？', {
						  btn: ['确认','取消'] //按钮
					}, function(index){
						window.location.href="userActionexcelimport2.action";
						layer.close(index);
					}, function(index){ 
						layer.close(index);
						 });
				}); 
				
				
				//监听提交
	              /* form.on('submit(login)', function(data){
	                console.log(data); 
	                return false;
	              }); */
				 
			});
		</script>
	</head>
	<body>
		
		
		<div class="layui-container">
			<button class="layui-btn" id="addstu">
		 		 <i class="layui-icon" >&#xe608;</i> 添加学生
			</button>  
			 <button class="layui-btn" id=erport>
				<i class="layui-icon">&#xe640;</i> 导出数据
			</button>
			<button class="layui-btn" id=erport2>
				<i class="layui-icon">&#xe640;</i> 导出数据2
			</button>
		</div>
		
		<div class="demoTable">
		    搜索：
	    <div class="layui-inline">
	        <input class="layui-input" name="id" id="demoReload" autocomplete="off">
	    </div>
		<button class="layui-btn" data-type="reload">搜索</button>
		</div>
		<table class="layui-hide" id="test" lay-filter="test" style="width: 100%"></table>
			导入Excel:
			<form action="userActionimport2.action" method="post" enctype="multipart/form-data">
				上传：<input type="file" name="fileName" />
				<input type="submit" value="上传" />
			</form>
	</body>
</html>
