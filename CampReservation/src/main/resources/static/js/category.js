
//////////////////////////////////////////
    //////메뉴 100% ////////////////////////////
$(function() {    
    $('.header_menu > li').mouseenter(function(){
        let menu_i = $(this).index();
        console.log(menu_i);
        
        if(menu_i < 4) { //하단 바(빨간색) 이동으로 인해 index는 4 이하로 한정시킴

            $('.menu_pan').css({ //모두 display:none 시킨 후 
                display:'none'
            }).eq($(this).index()).css({ // 해당 인덱스 넘버만 보여질 수 있도록 한다.
                display:'block'
            })
        }
    });
    $('.header_menu > li').mouseleave(function(){
        let menu_i = $(this).index();

        if(menu_i < 4) {

            $('.menu_pan').eq($(this).index()).css({
                display:'none'

            })
        }
    })

//menu_sub_pan : 100% 부분

    $('.menu_pan').mouseenter(function(){
        console.log("over");
        $('.menu_pan').css({
            display:'block'
        })
    })
    $('.menu_pan').mouseleave(function(){
        console.log("leave");
        $('.menu_pan').css({
            display:'none'
        })
    })
});