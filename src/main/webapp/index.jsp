<%--
  Created by IntelliJ IDEA.
  User: LRL
  Date: 2019/6/6
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="edge,chrome=1" >
    <title>index</title>
    <link href="css/common.css" rel="stylesheet" type="text/css"/>
    <link href="css/verify.css" rel="stylesheet" type="text/css"/>
    <link href="css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="css/animate.min.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/jquery.1.7.2.min.js"></script>
    <script type="text/javascript" src="js/customer2.js"></script>
    <script type="text/javascript" src="js/verify.js"></script>
</head>

<body>
<div class="bg_fff">
    <div class="bg_top">
        <div class="page_con">
            <ul class="func_top">
                <c:if test="${!empty QUser}" var="user">
                    <li><a class="btnB" data-dialog="dialog1">你好,${QUser.quserTel}</a></li>
                    <li><a class="btnB" href="/logout" data-dialog="dialog1">注销</a></li>
                </c:if>
                <c:if test="${empty QUser}">
                    <li><a class="btnB" href="login.jsp" >请登录</a></li>
                </c:if>
                <li class="mL24"><a href="register.jsp">注册</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="bg_header">
    <div class="page_con">
        <!-- <h1 class="logo_text"><a  href="index.html"><img alt="" width="100px" height="" src="images/logo_text.png"/></a></h1> -->
        <ul class="nav">
            <li><a href="index.jsp">首页</a></li>
            <li><a class="btnB" href="my_account.jsp" >我要下单</a></li>
            <li><a href="railway_class.jsp">物流专线</a></li>
            <li><a href="order_tracking.jsp">订单跟踪</a></li>
        </ul>
        <a  href="index.html">
            <!-- <h1 class="logo_icon"></h1> -->
        </a>
    </div>
</div>


<div class="content">
    <div class="slideshow"> <img class="change pre"  src="images/pre.png" > <img class="change next" src="images/next.png" >
        <div class="cirbox" >
            <div class="cir cr"></div>
            <div class="cir"></div>
            <div class="cir"></div>
            <div class="cir"></div>
            <div class="cir"></div>
        </div>
        <div class="imgbox"> <img class="img im" src="images/Carousel_1.png"> <img class="img"  src="images/Carousel_2.png"> <img class="img"  src="images/Carousel_3.png"> <img class="img"  src="images/Carousel_4.png"> <img class="img"  src="images/Carousel_5.png"> </div>
    </div>

    <div class="right_suspension right_xf">
        <ul>
            <li style="border:none;"><a href="javascript:goTop();" class="sidetop"><i class="rs_6"></i></a></li>
        </ul>
    </div>


    <div class="page_con clear">
        <h2 class="h2_module"> 我们的优势 </h2>
        <p class="h2_intro pTop_30">创办一周年，几千车队加盟，网点覆盖全国，
            为您选择最好的服务。</p>
        <div class="wrap_strengths">
            <ul class="sta_strengths">
                <li class="s1">
                    <div class="data">10000<br/>
                        <span>次</span></div>
                    <h5>累计成交</h5>
                </li>
                <li class="s2">
                    <div class="data">10000<br/>
                        <span>人</span></div>
                    <h5>注册用户</h5>
                </li>
            </ul>
            <div class="network"> <img src="images/img_network.png"/> </div>
        </div>
    </div>

    <div class="bg_f4 mTop_80">
        <div class="btn_wrap pTB_80">
            <div class="btn_inline">
                <ul>
                    <li><span class="text_btn">欢迎免费注册账号</span><a class="btn_com_A" href="pages/01_register/register_1.html">免费注册</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="wrap_login" id="dialog1">
    <div class="user_login">
        <h2>登录</h2>
        <div class="wrap_tab">
            <div class="tab_con">
                <div class="tab_con_list">
                    <ul>
                        <li>
                            <input type="text" class="input_login" placeholder="用户名"/>
                        </li>
                        <li>
                            <input type="text" class="input_login" placeholder="密码"/>
                        </li>
                    </ul>
                    <div id="mpanel1" > </div>
                    <a href="/front/pages/08_user_center/user_center.html">登录</a>
                </div>
            </div>
        </div>
    </div>

    <div class="wrap_register"> <a href="javascript:;" title="关闭" class="closeL">×</a>
        <div class="info_reg">
            <h2>注册</h2>
            <p>只需几步即可创建您的个人帐户<br/>
                并直接使用我们的在线服务。</p>
            <a class="btn_reg" href="pages/01_register/register_1.html">注册</a> </div>
    </div>
</div>

<div class="login_bg"></div>

<div class="footer">
    <div class="copyright">Copyright © 2017 - 2018 xxxx.com 版权所有</div>
</div>

<script src="js/banner.js" type="text/javascript"></script>
<script src="js/slider.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.hDialog.min.js"></script>
<script type="text/javascript">
    $(function(){
        //合作伙伴轮播
        $('#demo01').flexslider({
            animation: "slide",
            direction:"horizontal",
            easing:"swing"

        });

        //限制字符个数
        $(".nomore70").each(function(){
            var maxwidth=70;
            if($(this).text().length>maxwidth){
                $(this).text($(this).text().substring(0,maxwidth));
                $(this).html($(this).html()+'…');
            }
        });

    });


    /*滑动验证*/
    $('#mpanel1').slideVerify({
        type : 1,		//类型
        vOffset : 5,	//误差量，根据需求自行调整
        barSize : {
            width : '398px',
            height : '54px',
        },
        ready : function() {
        },


    });

    $('#mpanel2').slideVerify({
        type : 1,		//类型
        vOffset : 5,	//误差量，根据需求自行调整
        barSize : {
            width : '398px',
            height : '54px',
        },
        ready : function() {
        },
    });

    //右侧帮助弹出
    $(function(){
        var $el = $('.dialog_help');
        $el.hDialog(); //默认调用
        //slideOutRight关闭效果
        $('.demo40').hDialog({effect: 'slideOutRight'});
    });

</script>
</body>
</html>

