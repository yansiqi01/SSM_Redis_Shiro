<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/28 0028
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>登录</title>
    <style type="text/css">
        body {  font: 12px "微软雅黑";background-color: #FFFAE8;  }
        i { font-style: normal;}
        .login-box { width: 317px; height: 400px; border: 1px solid #1AA950;margin: 0 auto; }
        i, .login-color { color:#07913C;}
        body { margin: 0;}
        a { text-decoration: none;}
        input, .inp{ margin-bottom: 10px;}
        hr {margin-bottom:31px; }
        .left { margin-left: 90px; }
        h1{ text-align: center; }
        input, p { margin-left: 34px; }
        .inp {width: 232px; height: 36px; color:#07913C; padding: 0px 8px; border: 1px solid #dcdcdc; font-size: 14px; line-height: 36px; }
        .login-btn { border: none; color: white; width: 250px; height: 36px; line-height: 36px; background-color: #01793B; }
    </style>
    <script src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
    <script type="text/javascript">

        $(function(){
            $("#target").submit(function(){
                if(phnoe()==true&&mima()==true){
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
            else{
                $("#phone").hide();
                return true;
            }
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
    </script>
</head>
<body>
<header>
    <p><i>17</i>物流专线 | 登录 | 注册</p>
    <hr>
</header>
<nav id>

</nav>
<section class="login-box">
    <h1 class="login-color">用户登录</h1>
    <form action="/login" method="post" id="target">
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <input class="inp" type="text" id="name" name="quserTel" placeholder="请输入手机号" onblur="phnoe()"/>
                    <div id="phone" style="color:red"> </div>
                </td>
            </tr>
            <tr>
                <td>
                    <input class="inp" type="password" name="quserPassword" placeholder="请输入密码" onblur="mima()"/>
                    <div id="pd" style="color: red;"></div>
                </td>
            </tr>
            <tr>
                <td>
                    <a class="login-color left" href="">忘记密码？</a>
                </td>
            </tr>
            <tr>
                <td>
                    <input class="login-btn" type="submit" value="登录"/>
                </td>
            </tr>
        </table>
    </form>
    <p>还没有<i>17</i>账号？<a class="login-color" href="register.jsp">注册</a></p>
    <p>或者 <a href="/QQlogin"><i>快速登录</i></a></p>
</section>

<footer id="">

</footer>
</body>
</html>

