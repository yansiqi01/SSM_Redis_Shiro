<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>layout 后台大布局 - Layui</title>
<link rel="stylesheet" href="layui/css/layui.css">
 <style type="text/css">
        #index-container,html,body{
            margin:0px;
            padding:0px;
        }
        #index-container{
            width:100%;
            height:auto;
 
        }
 
        #index-navigationbar{
            width:100%;
            height:60px;
        }
 
        #index-navigationbar ul{
            padding-left:77%;
        }
 
        #index-commonmenu{
            width: 15%;
            height:519px;
            float: left;
        }
        #indixe-tab{
            width:84.9%;
            height: 150px;
            float: right;
        }
    </style>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">layui 后台布局</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="">控制台</a></li>
				<li class="layui-nav-item"><a href="">商品管理</a></li>
				<li class="layui-nav-item"><a href="">用户</a></li>
				<li class="layui-nav-item"><a href="javascript:;">其它系统</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">邮件管理</a>
						</dd>
						<dd>
							<a href="">消息管理</a>
						</dd>
						<dd>
							<a href="">授权管理</a>
						</dd>
					</dl></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img"> 贤心
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">基本资料</a>
						</dd>
						<dd>
							<a href="">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="">退了</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<!-- <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">所有商品</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;" id="student" data-type="tabAdd">学生管理</a></dd>
            <dd><a href="javascript:;">列表二</a></dd>
            <dd><a href="javascript:;">列表三</a></dd>
            <dd><a href="">超链接</a></dd>
          </dl>
        </li> 
        <li class="layui-nav-item">
          <a href="javascript:;">解决方案</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">列表一</a></dd>
            <dd><a href="javascript:;">列表二</a></dd>
            <dd><a href="">超链接</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="">云市场</a></li>
        <li class="layui-nav-item"><a href="">发布商品</a></li> -->
				</ul>
			</div>
		</div>  

		<div class="layui-body">
				<div class="layui-tab layui-tab-card" lay-allowclose="true" lay-filter="demo">
					<ul class="layui-tab-title">
						<!-- <li class="layui-this">网站设置</li>
						<li>用户基本管理</li>
						<li>权限分配</li>
						<li>商品管理</li>
						<li>订单管理</li> --> 
					</ul> 
					 
					<div class="layui-tab-content" style="height: 800px;">
					
					</div>
				</div>
			<!-- 内容主体区域 -->
			<!-- <div style="padding: 15px;">内容主体区域</div> -->
		</div>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			© layui.com - 底部固定区域 
		</div>
	</div>
	<script src="layui/layui.js"></script>
	<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  var $ = layui.jquery;
  
/* //触发事件
  var active = {
    tabAdd: function(){
      //新增一个Tab项
      element.tabAdd('demo', {
        title: '学生管理' //用于演示  
        //,content:'<iframe data-frameid="1" scrolling="auto" frameborder="0" src="student.jsp" style="width:100%;height:99%;"></iframe>'
        ,url:'student.jsp'
        ,id: 1 //实际使用一般是规定好的id，这里以时间戳模拟下
      })    
    }
    ,tabDelete: function(othis){
      //删除指定Tab项
      element.tabDelete('demo', '44'); //删除：“商品管理”
      
      othis.addClass('layui-btn-disabled');
    }
    ,tabChange: function(){
      //切换到指定Tab项
      element.tabChange('demo', '22'); //切换到：用户管理
    }
  };
  
  $('#student').on('click', function(){
    var othis = $(this), type = othis.data('type');
    active[type] ? active[type].call(this, othis) : '';
  }); */
  
  
  
  
//获取所有的菜单动态生成菜单===============================================================
$.ajax({
      type:"post",
      url:"json/test.json",
      dataType:"json",
      contentType : "application/json",//应用类型/json
      success:function(data){
          //先添加所有的主材单  
          $.each(data,function(i,obj){
              var content='<li class="layui-nav-item">';
              content+='<a href="javascript:;" class="site-demo-active">'+obj.meunTitle+'</a>';
              //这里是添加所有的子菜单 
              content+=loadchild(obj.trees);
              content+='</li>';
              $(".layui-nav-tree").append(content);
          });
          element.init();
      },
      error:function(jqXHR){
          aler("发生错误："+ jqXHR.status);
      }
  });
  
  //组装子菜单的方法
  function loadchild(obj){  
	  //alert(obj[0].treeTitile);
      if(obj==null){  
          return;
      }

      var content='';
      if(obj!=null && obj.length>0){
          content+='<dl class="layui-nav-child">';
      }else{
          content+='<dl>';
      }  

      if(obj!=null && obj.length>0){
          $.each(obj,function(i,note){
              content+='<dd>'; 
              content+='<a href="javascript:void(0)" data-url="'+note.url+'" data-title="'+note.treeTitile+'" data-id="'+note.id+'" name="item" class="site-demo-active">'+note.treeTitile+'</a>';
              if(note==null){
                  return;  
              }  
              //content+=loadchild(note);
              content+='</dd>';
          }); 
          content+='</dl>';
      }  
      console.log(content);
      return content;
  };
  
  //=======================================================================
	 
	  
	  
	  
	  
	//动态生成tab项
	//触发事件
  var active = {
      //在这里给active绑定几项事件，后面可通过active调用这些事件
      tabAdd: function(url,id,name) {
          //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
          //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
          element.tabAdd('demo', {
              title: name,
              content: '<iframe data-frameid="'+id+'" scrolling="auto" frameborder="0" src="'+url+'" style="width:100%;height:99%;"></iframe>',
              id: id //规定好的id 
          })
           CustomRightClick(id); //给tab绑定右击事件
           FrameWH();  //计算ifram层的大小
      },
      tabChange: function(id) {
          //切换到指定Tab项
          element.tabChange('demo', id); //根据传入的id传入到指定的tab项
      }, 
      tabDelete: function (id) {
      	  element.tabDelete("demo", id);//删除  
      }
      , tabDeleteAll: function (ids) {//删除所有
          $.each(ids, function (i,item) {
              element.tabDelete("demo", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
          })
      }
  };

  //body > div > div.layui-side.layui-bg-black > div > ul > li.layui-nav-item.layui-nav-itemed > dl > dd.layui-this > a
  //当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件

   
  $(document).on('click','body div div.layui-side.layui-bg-black div ul li.layui-nav-item.layui-nav-itemed dl dd.layui-this a', function() {
      var dataid = $(this);  
      //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
      if ($(".layui-tab-title li[lay-id]").length <= 0) { 
          //如果比零小，则直接打开新的tab项 
          active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"),dataid.attr("data-title"));
      } else {
          //否则判断该tab项是否以及存在

          var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
          $.each($(".layui-tab-title li[lay-id]"), function () {
              //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
              if ($(this).attr("lay-id") == dataid.attr("data-id")) {
                  isData = true;
              }
          })
          if (isData == false) {
              //标志为false 新增一个tab项
              active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"),dataid.attr("data-title"));
          }
      }
      //最后不管是否新增tab，最后都转到要打开的选项页面上
      active.tabChange(dataid.attr("data-id"));
  });

  function CustomRightClick(id) {
      //取消右键  rightmenu属性开始是隐藏的 ，当右击的时候显示，左击的时候隐藏
      $('.layui-tab-title li').on('contextmenu', function () { 
    	  return false; 
      });
      
      $('.layui-tab-title,.layui-tab-title li').click(function () {
          $('.rightmenu').hide();
      });
      //桌面点击右击 
      $('.layui-tab-title li').on('contextmenu', function (e) {
          var popupmenu = $(".rightmenu");
          popupmenu.find("li").attr("data-id",id); //在右键菜单中的标签绑定id属性

          //判断右侧菜单的位置 
          l = ($(document).width() - e.clientX) < popupmenu.width() ? (e.clientX - popupmenu.width()) : e.clientX;
          t = ($(document).height() - e.clientY) < popupmenu.height() ? (e.clientY - popupmenu.height()) : e.clientY;
          popupmenu.css({ left: l, top: t }).show(); //进行绝对定位
          //alert("右键菜单")
          return false;
      });
  }

  $(".rightmenu li").click(function () {

      //右键菜单中的选项被点击之后，判断type的类型，决定关闭所有还是关闭当前。
      if ($(this).attr("data-type") == "closethis") {
          //如果关闭当前，即根据显示右键菜单时所绑定的id，执行tabDelete
          active.tabDelete($(this).attr("data-id"))
      } else if ($(this).attr("data-type") == "closeall") {
          var tabtitle = $(".layui-tab-title li");
          var ids = new Array();
          $.each(tabtitle, function (i) {
              ids[i] = $(this).attr("lay-id");
          })
          //如果关闭所有 ，即将所有的lay-id放进数组，执行tabDeleteAll
          active.tabDeleteAll(ids);
      }

      $('.rightmenu').hide(); //最后再隐藏右键菜单
  })
  function FrameWH() {
      var h = $(window).height() -41- 10 - 60 -10-44 -10;
      $("iframe").css("height",h+"px");
  }

  $(window).resize(function () {
      FrameWH();
  })
  
  
});


	  
	  
	  
	
  
</script>
</body>
</html>