
// 弹窗jQ

$().ready(function(){
	$('.btnB').click(function () {
		$('.login_bg').fadeIn(100)
		$('#' + $(this).data('dialog')).slideDown(200)
	});
	$('.closeL').click(function () {
		$('.login_bg').fadeOut(100)
		$(this).closest('.wrap_login').slideUp(200)
		$('#' + $(this).data('dialog')).slideUp(200)
	})
});

// 弹窗jQ

$().ready(function(){
	$('.tcp').click(function () {
		$('.tcp_bg').fadeIn(100)
		$('#' + $(this).data('dialog')).slideDown(200)
	});
	$('.close_t').click(function () {
		$('.tcp_bg').fadeOut(100)
		$(this).closest('.wrap_tcp').slideUp(200)
		$('#' + $(this).data('dialog')).slideUp(200)
	})
});




$(function(){
		
    /*tab标签切换*/
    function tabs(tabTit,on,tabCon){
	$(tabCon).each(function(){
	  $(this).children().eq(0).show();
	 
	  });
	$(tabTit).each(function(){
	  $(this).children().eq(0).addClass(on);
	  });
     $(tabTit).children().click(function(){
        $(this).addClass(on).siblings().removeClass(on);
         var index = $(tabTit).children().index(this);
         $(tabCon).children().eq(index).show().siblings().hide();
    });
     }
  tabs(".tab_title","on",".tab_con");
  
 });


 $(function(){
		
    /*tab标签切换*/
    function tabs(tabTit,on,tabCon){
	$(tabCon).each(function(){
	  $(this).children().eq(0).show();
	 
	  });
	$(tabTit).each(function(){
	  $(this).children().eq(0).addClass(on);
	  });
     $(tabTit).children().click(function(){
        $(this).addClass(on).siblings().removeClass(on);
         var index = $(tabTit).children().index(this);
         $(tabCon).children().eq(index).show().siblings().hide();
    });
     }
  tabs(".tab_title_u","on_u",".tab_con_u");
  
 });

//右侧悬浮
$(document).ready(function(){



	$(".right_suspension ul li").hover(function(){

		$(this).find(".sidebox").stop().animate({"width":"160px","padding-left":"10px","z-index":"666"},200).css({"opacity":"1","filter":"Alpha(opacity=100)","background":"#fc5767"})
		$(this).find(".sidebox_wx").stop().animate({"width":"200px","height":"160px","padding-left":"0","z-index":"999"},200).css({"opacity":"1","filter":"Alpha(opacity=100)","background":"#fc5767"})
		

	},function(){

		$(this).find(".sidebox").stop().animate({"width":"48px","padding-left":"0",},200).css({"background":"#fff"})	
$(this).find(".sidebox_wx").stop().animate({"width":"48px","height":"48px","padding-left":"0",},200).css({"background":"#fff"})	

	});

	

});



//回到顶部

function goTop(){

	$('html,body').animate({'scrollTop':0},600);

}


//滚动后导航固定
$(function(){
	$(window).scroll(function(){
          height = $(window).scrollTop();
   	  	  if(height > 170){
   	  	  	$('.bg_header_second').fadeIn();
   	  	  }else{
   	  	  	$('.bg_header_second').fadeOut();
   	  	  };

});
});
	


//滚动后出现
$(function(){
	$(window).scroll(function(){
          height = $(window).scrollTop();
   	  	  if(height > 400){
   	  	  	$('.right_xf').fadeIn();
   	  	  }else{
   	  	  	$('.right_xf').fadeOut();
   	  	  };

});
});
	


$(function(){
		
	//顶部下拉
$(".lang").mouseenter(function(){
	$('.lang').css({
		'background':'#fcfdff',
	
	});
	$('.flag').css({
		'display':'block',
		'top':'49'+'px'
	});
}).mouseleave(function(){
	$('.lang').css({
		'background':'transparent'
	});
	$('.flag').css({
		'display':'none'
	})
});
	
	
	
		//我的账户下拉
$(".acc").mouseenter(function(){
	$('.acc').css({
		'background':'#fcfdff',
	
	});
	$('.account_con_A').css({
		'display':'block',
		'top':'50'+'px'
	});
}).mouseleave(function(){
	$('.acc').css({
		'background':'transparent'
	});
	$('.account_con_A').css({
		'display':'none'
	})
});
	
	
});


