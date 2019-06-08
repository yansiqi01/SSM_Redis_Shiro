'use strict';

var placeholders = document.querySelectorAll('.styled-input__placeholder-text'),
    inputs = document.querySelectorAll('.styled-input__input');

placeholders.forEach(function (el, i) {
    var value = el.innerText,
        html = '';
    for (var _iterator = value, _isArray = Array.isArray(_iterator), _i = 0, _iterator = _isArray ? _iterator : _iterator[Symbol.iterator]();;) {
        var _ref;

        if (_isArray) {
            if (_i >= _iterator.length) break;
            _ref = _iterator[_i++];
        } else {
            _i = _iterator.next();
            if (_i.done) break;
            _ref = _i.value;
        }

        var w = _ref;

        if (!value) value = '&nbsp;';
        html += '<span class="letter">' + w + '</span>';
    }
    el.innerHTML = html;
});

inputs.forEach(function (el) {
    var parent = el.parentNode;
    el.addEventListener('focus', function () {
        parent.classList.add('filled');
        placeholderAnimationIn(parent, true);
    }, false);
    el.addEventListener('blur', function () {
        if (el.value.length) return;
        parent.classList.remove('filled');
        placeholderAnimationIn(parent, false);
    }, false);
});

function placeholderAnimationIn(parent, action) {
    var act = action ? 'add' : 'remove';
    var letters = parent.querySelectorAll('.letter');
    letters = [].slice.call(letters, 0);
    if (!action) letters = letters.reverse();
    letters.forEach(function (el, i) {
        setTimeout(function () {
            var contains = parent.classList.contains('filled');
            if (action && !contains || !action && contains) return;
            el.classList[act]('active');
        }, 50 * i);
    });
}

setTimeout(function () {
    document.body.classList.add('on-start');
}, 100);

setTimeout(function () {
    document.body.classList.add('document-loaded');
}, 1800);


/********************************
 * webluker首页所需要的一些公共JS库
 * Author: hua.zhang
 * Creation data: 2010-12-23
 * ******************************/

$(function(){
    $(".top_menu .top_menu_child a").bind('mouseover mouseout',function(){
        $(this).toggleClass($(this).attr('class').split(' ')[0] + '_over');
    });

    $(".top_menu .top_menu_child a").bind('mousedown mouseup',function(){
        $(this).toggleClass($(this).attr('class').split(' ')[0] + '_press');
    });

    $(".msg_box_3 a").bind('mouseover mouseout',function(){
        $(this).toggleClass($(this).attr('class').split(' ')[0] + '_over');
    });

    $(".explorer_main .box_main .explorer_card_list a").mouseover(function(){
        $(this).animate({bottom: '+8px'}, "slow");
    }).mouseout(function(){
        $(this).animate({bottom: '-0'}, "slow");
    });

});

/*Error message Tooltips*/
/*点击隐藏错误提示*/
$(document).ready(function(){
    $('.control-group input').focus(function(){
        hideTooltips($(this).parent().parent().attr('id'));
    });
});
function showTooltips(msgid,msg){
    if (msgid==''){ return; }
    if (msg==''){ msg='Error!'; }
    $('#'+msgid).prepend("<div class='for_fix_ie6_bug' style='position:relative;'><div class='tooltips_main'><div class='tooltips_box'><div class='tooltips'><div class='msg'>"+msg+"</div></div><div class='ov'></div></div></div></div>");
    $('#'+msgid+' .tooltips_main').fadeIn("slow").animate({ marginTop: "-23px"}, {queue:true, duration:400});
}
function hideTooltips(msgid){
    try{
        $('#'+msgid).find('.tooltips_main').fadeOut("slow");
        $('#'+msgid).find('.tooltips_main').remove();
    }catch(e){}
}
function hideAllTooltips(){
    try{
        $('.tooltips_main').fadeOut("slow");
        $('.tooltips_main').remove();
    }catch(e){}
}
/*End error message tooltips*/

/*去除超链接的虚线框*/
$(document).ready(function(){
    $('a').bind('focus',function(){if(this.blur)this.blur();});
});
/*end*/

/*CopyRight*/
$(function(){
    var date = new Date();
    var year = date.getFullYear();
    $('#copyright').append(year);
});
/*end CopyRight*/