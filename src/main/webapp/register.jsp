<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>注册</title>
		<style type="text/css">
			body {  font: 12px "微软雅黑"; font-style: normal; background-color: #FFFAE8; }
			input, .inp{ margin-bottom: 10px;}
			h1 {text-align: center;}
			i, .login-color { color:#07913C;}
			i { font-style: normal;}
			a { text-decoration: none;}
			input, p { margin-left: 34px; }
			.content { width: 317px; height:400px; border: 1px solid #1AA950;margin: 0 auto;}
			.register-btn { border: none; color: white; width: 250px; height: 36px; line-height: 36px; background-color: #01793B; }
			.verify { width: 100px; height: 36px; color:#b6b6b6; padding: 0px 8px; border: 1px solid #dcdcdc; font-size: 14px; line-height: 36px; }
			.get_verify{ height: 36px; color:#b6b6b6; padding: 0px 8px; border: 1px solid #dcdcdc; font-size: 14px; line-height: 36px; background-color: #01793B;}
			.inp {width: 232px; height: 36px; color:#b6b6b6; padding: 0px 8px; border: 1px solid #dcdcdc; font-size: 14px; line-height: 36px; }
		</style>
       <script src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>

        <script type="text/javascript">
               var yzm ="";
               var str="";
             $(function(){
                 $("#target").submit(function(){
                     if(phnoe()==true&&yzuser()==true&&yz()==true&&mima()==true&&qrmima()==true&&check()==true){
                         return true;
                     }
                         return false;
                 });
             });

               function phnoe(){
                   var rex = /^1[3-9]+\d{9}$/;
                   if(!( rex.test($("#name").val()))){
                       $("#phone").text("您的手机号码格式不正确").show();
                       return false;
                   }
                   $("#phone").hide();
                   return true;
               }

              function hyzm(){
                   $.ajax({
                       url:'/getyzm',
                       Type:'post',
                       data:{"quserTel":$("#name").val()},
                       success:function(date){
                           console.log(date);
                           yzm=date;
                       },
                       error:function(){
                           alert('操作错误');
                       }
                   });
               }

               function  getuser(){
                   $.ajax({
                       url:'/rzuser',
                       data:{"QuserTel":$("#name").val()},
                       Type:'post',
                       success:function(data){
                           str=data
                       }
                   });
               }

               function yzuser(){
                   if(str==1){
                       $("#phone").text("该用户已经存在").show();
                       return false;
                   }
                   $("#phone").hide();
                   return true;
               }

               function yz(){
                   if($("input[name='yzm']").val()==""){
                       alert('请输入验证码!!!!');
                       return false;
                   }
                   if($("input[name='yzm']").val()!=yzm){
                       alert('请输入正确的验证码!!!!');
                       return false;
                   }
                   return true;
               }

               function mima(){
                   var pwdReg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/;
                   if(!(pwdReg.test($("input[name='quserPassword']").val()))){
                       $("#pd").text("请输入正确的密码格式").show();
                       return false;
                   }
                   $("#pd").hide();
                   return true;
               }

               function qrmima(){
                   if($("input[name='quserPassword']").val()!= $("input[name='querenmima']").val()){
                       $("#dc").text("两次密码不一致,请重新输出").show();
                       return false;
                   }
                   $("#dc").hide();
                   return true;
               }

               function  check(){
                   var isChecked = $('#chekd').attr('checked');
                   if(isChecked==false){
                       alert("请勾选协议");
                       return false;
                   }
                   return true;
               }
        </script>
	</head>
	<body>
		<section class="content">
			<h1 class="login-color">用户注册</h1>
			<form action="/register" method="post" id="target">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<input class="inp" type="text" id="name" name="quserTel" placeholder="请输入手机号" onblur="phnoe(),getuser()" />
                            <div id="phone" style="color:red"> </div>
						</td>
					</tr>
					<tr>
						<td>
							<input class="verify" type="password" name="yzm" placeholder="请输入验证码"/>
							<input class="get_verify" type="button" value="获取验证码" id="button" onclick="hyzm()"/>
						</td>
					</tr>
					<tr>
						<td>
							<input class="inp" type="password" name="quserPassword" placeholder="8~16位数字和英文字母的组合" onblur="mima()" />
                            <div id="pd" style="color: red;"></div>
						</td>
					</tr>
					<tr>
						<td>
							<input class="inp" type="password" name="querenmima" placeholder="请输入确认密码" onblur="qrmima()" />
                            <div id="dc" style="color: red"></div>
						</td>
					</tr>
						<tr>
						<td>
							<input  type="checkbox" id="chekd"  checked="checked"/>我同意<a href=""><i>《服务协议》</i></a>、<a href=""><i>《隐私政策》</i></a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input class="register-btn" type="submit" value="注册"/>
						</td>
					</tr>
					
				</table>
			</form>
			<p>拥有<i>17</i>账号？<a class="login-color" href="login.html">去登录</a></p>
		</section>
	</body>
</html>
