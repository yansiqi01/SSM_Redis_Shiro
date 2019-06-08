<%--
  Created by IntelliJ IDEA.
  User: LRL
  Date: 2019/6/6
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="edge" />
    <title>用户中心-我的对账单</title>
    <link href="css/common.css" rel="stylesheet" type="text/css"/>
    <link href="css/reset.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/jquery.1.7.2.min.js"></script>
    <script type="text/javascript" src="js/customer2.js"></script>
    <script type="text/javascript">
        $(function(){
            select();
        });
      function select() {
          if( $("#goodsType").val()==1){
              $("#volume").hide();
              $("#weight").show();
              $("#weight").val("")
          }
          if( $("#goodsType").val()==2){
              $("#weight").hide();
              $("#volume").show();
              $("#volume").val("")
          }
      }
      function money() {
          var money;
          if($("#goodsType option:selected").val()==1){
              if($("#Lid option:selected").val()==1){
                  money =  $("#weight").val()*0.7
              }
              if($("#Lid option:selected").val()==2){
                  money =  $("#weight").val()*0.5
              }
          }
          if($("#goodsType option:selected").val()==2){
              if($("#Lid option:selected").val()==1){
                  money = $("#volume").val()*210
              }
              if($("#Lid option:selected").val()==2){
                  money = $("#volume").val()*150
              }
          }
               $("#hid").val(money);
                 console.log(money)
      }
    </script>

</head>

<body class="bg_f4">

<div class="bg_header">
    <div class="page_con">
        <div class="my_account_A acc_mT">
            <div class="acc clear"> 我的账户 <span class="tri"></span>
                <div class="account_con_A">
                    <ul>
                        <li><a class="acl1" href="user_center.html">个人中心</a></li>
                        <li><a class="acl1" href="index.jsp">退出账号</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="right_suspension right_xf">
    <ul>
        <li style="border:none;"><a href="javascript:goTop();" class="sidetop"><i class="rs_6"></i></a></li>
    </ul>
</div>

<div class="bg_user"></div>
<div class="wrap_user clear">
    <div class="left_menu">
        <ul>
            <li><a href="my_booking.jsp">我的订单</a></li>
            <li><a href="my_account.jsp">我要下单</a></li>
        </ul>
    </div>

    <div class="bg_com mTop_40 clear">
        <div class="h2_booking">我要下单</div>

        <form action="/addOrder" method="post">

            <div class="booking_box clear">

                <div class="booking_box_left">
                    <h2>发货方</h2>
                    <p>
                        <label class="booking_lable">发货人姓名</label>
                        <input type="text" class="inp_text" name="orderSendname" id="sds" value="" />
                    </p>
                    <p>
                        <label class="booking_lable">发货人地址</label>
                        <input type="text" class="inp_text" name="orderSendaddress" id="sdsd" value="" />
                    </p>
                    <p>
                        <label class="booking_lable" >发货人电话</label>
                        <input type="text" class="inp_text" name="orderSendtel" id="sdsddsd" value="" />
                    </p>
                    <p>
                        <label class="booking_lable" >货物类型</label>
                        <select  name="GoodsId" id="goodsType" onchange="select()">
                            <option value="1">重货</option>
                            <option value="2">泡货</option>
                        </select>
                    </p>
                </div>
                <div class="">
                    <h2>收货方</h2>
                    <p>
                        <label  class="booking_lable">收货人姓名</label>
                        <input type="text" class="inp_text" name="orderReceivename" id="zzzzz" value="" />
                    </p>
                    <p>
                        <label  class="booking_lable">收货人地址</label>
                        <input type="text" class="inp_text" name="orderReceiveaddress" id="zzzz" value="" />
                    </p>
                    <p>
                        <label  class="booking_lable">收货人电话</label>
                        <input type="text" class="inp_text" name="orderReceivetel" id="zzz" value="" />
                    </p>
                </div>

                <div class="xl">
                    <h2>选择线路</h2>
                    <p>
                        <select  name="LineId" id="Lid" onchange="money()">
                              <option value="0">请选择线路</option>
                            <option value="1">长沙---->上海</option>
                            <option value="2">长沙---->深圳</option>
                        </select>
                    </p>
                </div>
                <div class="booking_box_right ">
                    <h2>货物信息</h2>
                    <p>
                        <label class="booking_lable" >货物体积</label>
                        <input type="text" class="inp_text" id="volume" name="orderVolume" placeholder="以立方为单位"  onmouseleave="money()" value="" />
                    </p>
                    <p>
                        <label class="booking_lable" >货物重量</label>
                        <input type="text" class="inp_text" id="weight" placeholder="以体积为单位" onmouseleave="money()"  name="orderWeight"  value="" />
                    </p>
                    <p>
                        <label  class="booking_lable">备注信息</label>
                        <input type="text"  class="inp_text" name="orderRemark" value="" />
                    </p>
                    <p>
                        <label ><input class="form_checkbox" type="checkbox"/>&nbsp;同意<a class="tcp" href="#" data-dialog="dialog3">《运货收费说明》</a></label>
                    </p>
                    <input type="hidden" id="hid"  name="mony">
                    <input type="submit" class="inp_btn" value="提交订单"/>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="wrap_tcp" id="dialog3">
    <h3>运货收费说明 <a href="javascript:;" title="关闭" class="close_t">×</a> </h3>
    <div class="content_tcp">
        <p>长沙-->上海 重货按照0.7元/KG的价格，泡货按照泡货210元/立方</p>
        <p>长沙-->深圳 重货按照0.5元/KG的价格,泡货按照泡货190元/立方</p>
        <p>本协议由您与应运物流管理有限公司共同缔结，本协议具有合同效力。</p>
        <p>本协议中协议双方合称协议方，应运物流管理有限公司在协议中亦称为“订舱公司”。本协议中“应运物流”指由应运物流管理有限公司运营的网络交易平台，域名为rail.com。</p>
        <h5>一、协议内容及签署</h5>
        <p>1．本协议内容包括协议正文及所有rail已经发布的或将来可能发布的各类规则。所有规则为本协议不可分割的组成部分，与协议正文具有同等法律效力。除另行明确声明外，任何rail及其关联公司提供的服务（以下称为“rail”）均受本协议约束。</p>
        <p>2．您应当在使用rail服务之前认真阅读全部协议内容，对于协议中以加粗字体显示的内容，您应重点阅读。如您对协议有任何疑问的，应向rail咨询。但无论您事实上在使用rail服务之前是否认真阅读了本协议内容，只要您使用rail服务，则本协议即对您产生约束，届时您不应以未阅读本协议的内容或者未获得rail对您问询的解答等理由，主张本协议无效，或要求撤销本协议。</p>
        <h5>二、协议内容及签署</h5>
        <p>1．本协议内容包括协议正文及所有rail已经发布的或将来可能发布的各类规则。所有规则为本协议不可分割的组成部分，与协议正文具有同等法律效力。除另行明确声明外，任何rail及其关联公司提供的服务（以下称为“rail”）均受本协议约束。</p>
        <p>2．您应当在使用rail服务之前认真阅读全部协议内容，对于协议中以加粗字体显示的内容，您应重点阅读。如您对协议有任何疑问的，应向rail咨询。但无论您事实上在使用rail服务之前是否认真阅读了本协议内容，只要您使用rail服务，则本协议即对您产生约束，届时您不应以未阅读本协议的内容或者未获得rail对您问询的解答等理由，主张本协议无效，或要求撤销本协议。</p>
        <P>&nbsp;</P>
    </div>
</div>
<div class="tcp_bg"></div>

<div class="footer" style="margin-top: 0;">
    <div class="copyright">Copyright © 2017 - 2018 xxxx.com 版权所有</div>
</div>
</div>
<script src="js/slider.js" type="text/javascript"></script>
<script type="text/javascript" src="js/laydate/laydate.js"></script>
<script type="text/javascript">
    $(function(){
        //执行多个日历
        lay('.lay_t_item').each(function(){
            laydate.render({
                elem: this
            });
        });
    });
</script>
</body>
</html>
