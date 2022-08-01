	var cnt = 0;
    var arr1 = [];
    var arr2 = [];
   $(function() {
	console.log(arr2.length);
	$(".modal_content").click(function(){
		$(".modal").fadeOut();
		$(".modal-overlap").fadeOut();
	});

	$(".left-compare > .compare-img > .close-btn").click(function(){
		arr1 = [];
		console.log(".left-compare > .compare-img > .close-btn");
		if(arr2.length > 0){ //만약 rightcompare에 값이 있을경우
			arr1 = arr2;  // arr1에 arr2를 넣는다.
			cnt =1; //cnt를 1로 설정후 leftcompare에 값을 넣는다.
			$(".cnt_compare").html("비교하기("+(cnt)+")");
	        $(".left-compare > .compare-img > img").attr("src",arr2[1]);
	        $(".left-compare > .compare-name-addr-wrap > .compare-name > span").html(arr2[2]);
	        $(".left-compare > .compare-name-addr-wrap > .compare-addr > span").html(arr2[3]);
			arr2=[];
	        $(".right-compare > .compare-img > img").attr("src","/resources/img/unknown_img.png");
	        $(".right-compare > .compare-name-addr-wrap > .compare-name > span").html("");
	        $(".right-compare > .compare-name-addr-wrap > .compare-addr > span").html("");
	        $(".right-compare > .compare-img > .close-btn").attr("style","display:none");
	        console.log(".left-compare > .compare-img > .close-btn 의 if");
		}else{
	        console.log(".left-compare > .compare-img > .close-btn 의 else");
	        arr1 = [];
	        cnt =0 ;
			$(".left-compare > .compare-img > img").attr("src","/resources/img/unknown_img.png");
	        $(".left-compare > .compare-name-addr-wrap > .compare-name > span").html("");
	        $(".left-compare > .compare-name-addr-wrap > .compare-addr > span").html("");
	        $(".left-compare > .compare-img > .close-btn").attr("style","display:none");
			$(".cnt_compare").html("비교하기("+cnt+")");
			$(".compaer-container").attr("style","display:none");
		}
	});

	$(".right-compare > .compare-img > .close-btn").click(function(){
		console.log(".right-compare > .compare-img > .close-btn 의 else");
		arr2 = [];
		console.log("arr1"+arr1);
		console.log("arr2"+arr2);
	        $(".left-compare > .compare-img > img").attr("src",arr2[1]);
	        $(".left-compare > .compare-name-addr-wrap > .compare-name > span").html(arr2[2]);
	        $(".left-compare > .compare-name-addr-wrap > .compare-addr > span").html(arr2[3]);
	        $(".left-compare > .compare-img > .close-btn").attr("style","display:flex");
	        
	        $(".right-compare > .compare-img > img").attr("src","/resources/img/unknown_img.png");
	        $(".right-compare > .compare-name-addr-wrap > .compare-name > span").html("");
	        $(".right-compare > .compare-name-addr-wrap > .compare-addr > span").html("");
			$(".right-compare > .compare-img > .close-btn").attr("style","display:none")
	        console.log(".right-compare > .compare-img > .close-btn 종료");
			cnt =1;
	});
	
	$(".cnt_compare_btn > span").click(function(){
		if( (arr1.length == 0) || (arr2.length == 0)){ // 비교하기에 값이 들어가있는지 확인하고 페이지 이동
			$(".modal-overlap").fadeIn(); 
		}else if(arr1.length > 0 & arr2.length >0){
			location.href ="compare?camp_id="+ arr1[0] +"&camp_id2="+ arr2[0]; 
		}
	});
	
   });
   function compare(camp_id, camp_img, camp_name, camp_addr) {
      // 받아야하는 값 dto.camp_id/dto.camp_img/dto.camp_name/dto.camp_addr
      // 1. 버튼을 누르면 비교 div를 display none;에서 block;으로 바꾼다
      if(cnt === 0){ // cnt가 0이면 leftcompare 에 값을 넣는다.
    	  console.log("compare if(cnt === 0)");
          arr1 = [camp_id,camp_img,camp_name,camp_addr];
          $(".cnt_compare").html("비교하기("+(cnt+1)+")");
          $(".compaer-container").attr("style","display:flex");
          $(".left-compare > .compare-img > img").attr("src",arr1[1]);
          $(".left-compare > .compare-name-addr-wrap > .compare-name > span").html(arr1[2]);
          $(".left-compare > .compare-name-addr-wrap > .compare-addr > span").html(arr1[3]);
          $(".left-compare > .compare-img > .close-btn").attr("style","display:flex");
          console.log("compare if(cnt === 0) 종료");

      }else if(cnt == 1){// cnt가 1이면 rightcompare 에 값을 넣는다.
    	 arr2 = [camp_id,camp_img,camp_name,camp_addr];
    	 if(arr1[0] == arr2[0]){
    		 $(".modal-overlap").fadeIn(); 
    		 return;
    	 }
    	 $(".cnt_compare").html("비교하기("+(cnt+1)+")");
         $(".right-compare > .compare-img > img").attr("src",arr2[1]);
         $(".right-compare > .compare-name-addr-wrap > .compare-name > span").html(arr2[2]);
         $(".right-compare > .compare-name-addr-wrap > .compare-addr > span").html(arr2[3]);
         $(".right-compare > .compare-img > .close-btn").attr("style","display:flex");
         console.log("compare if(cnt === 1) else if 종료");

      }else if(cnt >= 2){ // 2개 이상 선택했을경우

    	  $(".modal").fadeIn();
		  return; 

      }
      cnt++;
		
   }