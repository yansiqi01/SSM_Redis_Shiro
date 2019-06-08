;(function($){
	$.extend({
		inputStyle:function(){
			function check(el,cl){
				$(el).each(function(){
					$(this).parent('.wrap_input').removeClass(cl);

					var checked = $(this).prop('checked');
					if(checked){
						$(this).parent('.wrap_input').addClass(cl);
					}
				})
			}	
			$('input[type="radio"]').on('click',function(){
				check('input[type="radio"]','radio_bg_check');
			})
			$('input[type="checkbox"]').on('click',function(){
				check('input[type="checkbox"]','checkbox_bg_check');
			})
		}
		
	})

})(jQuery)

//调用
$(function(){
	$.inputStyle();
})