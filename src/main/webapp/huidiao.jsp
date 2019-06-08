<%--
  Created by IntelliJ IDEA.
  User: LRL
  Date: 2019/5/20
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>码奴堡</title>
    <link href="css/jq22.css" rel="stylesheet" type="text/css" />
    <script src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
</head>
<body>
<div class='body_main'>
    <!-- start main content -->
    <div class='index_box' style='margin-top:20px;'>
        <div style="position:fixed;color:red;margin:70px 0 0 450px;font-size:16px;Z-index:100;display:block;" id="hint"></div>
        <div class='box_title'>
            <div class='text_content'>
            </div>
        </div>
        <div class='box_main'>
            <div id="register" class="register">
                <form id="form" action="/updateTel" method="post" onSubmit="return check();">
                    <div id="form_submit" class="form_submit">
                        <div class="fieldset">
                            <div class="field-group">
                                <label class="required title">手机号码</label>
                                <span class="control-group" id="mobile_input">
                   <div class="input_add_long_background">
                  <input class="register_input" type="text" id="mobile" name="QuserTel"  maxLength="11" value=""  onmouseout="phnoe(),getuser()">
                       <div id="phone" style="color:red"> </div>
                </div>
                </span>
                                <label class="tips">仅用于发送服务开通与到期提醒以及紧急故障方便联系到您，绝对保密</label>
                            </div>
                            <div class="field-group">
                            <div class="field-group">
                                <label class="required title">设置密码</label>
                                <span class="control-group" id="password1_input" name="QuserPassword">
                 <div class="input_add_long_background">
                  <input class="register_input" type="password" id="password1" name="QuserPassword" maxLength="20" value="" onmouseout="mima()" />
                    <div id="pd" style="color: red;"></div>
                </div>
                </span>
                                <label class="tips">请使用6~20个英文字母（区分大小写）、符号或数字</label>
                            </div>

                </span>
                            </div>
                        </div>
                    </div>
                    <div id="div_submit" class="div_submit">
                        <div class='div_submit_button'>
                            <input id="submit" type="submit" id="#target" value="确定" class='button_button disabled'>
                        </div>
                    </div>
                </form>
            </div>
              <h6 style="color: red"><a href="success.jsp">跳过此步骤</a></h6>
            <script type="text/javascript">
                    $(function(){
                        $("#target").submit(function(){
                            if(phnoe()==true){
                                return true;
                            }
                             return false;
                        });
                    });
                function phnoe(){
                    var rex = /^1[3-9]+\d{9}$/;
                    if(!( rex.test($("#mobile").val()))){
                        $("#phone").text("您的手机号码格式不正确").show();
                        return false;
                    }
                    $("#phone").hide();
                       return true;
                }

                function mima(){
                    var pwdReg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/;
                    if(!(pwdReg.test($("input[name='QuserPassword']").val()))){
                        $("#pd").text("请输入正确的密码格式").show();
                        return false;
                    }
                    $("#pd").hide();
                    return true;
                }
                    function  getuser(){
                        $.ajax({
                            url:'/rzuser',
                            data:{"QuserTel":$("#mobile").val()},
                            Type:'post',
                            success:function(data){
                                console.log(data)
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

            </script>
        </div>
        <div class='box_bottom'></div>
    </div>
</div>

</body>
</html>
