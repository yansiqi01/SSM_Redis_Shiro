$(document).ready(function(){
	var t;
	var index=0;
	var times=5000;//间隔时间
	t=setInterval(play,times);
	
	function play(){
		index++;
		if(index>4){index=0}
		$('.img').eq(index).fadeIn(1000).siblings().fadeOut(1000)
		$('.cir').eq(index).addClass('cr').siblings().removeClass('cr')
	}
	
	$('.cir').click(function(){
		$(this).addClass('cr').siblings().removeClass('cr')
		var index=$(this).index()
		$('.img').eq(index).fadeIn(600).siblings().fadeOut(600)
	})
	
	$('.pre').click(function(){
		index--
		if(index<0){index=4}
		$('.img').eq(index).fadeIn(1000).siblings().fadeOut(1000)
		$('.cir').eq(index).addClass('cr').siblings().removeClass('cr')
	})
	$('.next').click(function(){
		index++
		if(index>4){index=0}
		$('.img').eq(index).fadeIn(1000).siblings().fadeOut(1000)
		$('.cir').eq(index).addClass('cr').siblings().removeClass('cr')
	})
	
	$('.banner').hover(
		function(){
			clearInterval(t)
		},
		function(){
			t=setInterval(play,times)
			function play(){
				index++
				if(index>4){index=0}
				$('.img').eq(index).fadeIn(1000).siblings().fadeOut(1000)
				$('.cir').eq(index).addClass('cr').siblings().removeClass('cr')
			}
		}
	);
	
});
	
