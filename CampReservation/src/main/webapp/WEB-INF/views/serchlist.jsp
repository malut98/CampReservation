<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org"
   xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/star.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/banner.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/notice.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/compare.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/camplist.css"
   type="text/css">
<link rel="StyleSheet" href="/resources/css/Category.css"
   type="text/css">
<script type="text/javascript" src="/resources/js/star.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet"
   href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="/resources/js/category.js"></script>
<script type="text/javascript">

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
		location.href ="clist/compare?camp_id="+ arr1[0] +"&camp_id2="+ arr2[0]+"&memberid="+arr1[4]; 
	}
});

});
function compare(camp_id, camp_img, camp_name, camp_addr, memberid) {
  // 받아야하는 값 dto.camp_id/dto.camp_img/dto.camp_name/dto.camp_addr
  // 1. 버튼을 누르면 비교 div를 display none;에서 block;으로 바꾼다
  if(cnt === 0){ // cnt가 0이면 leftcompare 에 값을 넣는다.
	  console.log("compare if(cnt === 0)");
      arr1 = [camp_id,camp_img,camp_name,camp_addr, memberid];
      $(".cnt_compare").html("비교하기("+(cnt+1)+")");
      $(".compaer-container").attr("style","display:flex");
      $(".left-compare > .compare-img > img").attr("src",arr1[1]);
      $(".left-compare > .compare-name-addr-wrap > .compare-name > span").html(arr1[2]);
      $(".left-compare > .compare-name-addr-wrap > .compare-addr > span").html(arr1[3]);
      $(".left-compare > .compare-img > .close-btn").attr("style","display:flex");
      console.log("compare if(cnt === 0) 종료");
      console.log(arr1[4]);
      

  }else if(cnt == 1){// cnt가 1이면 rightcompare 에 값을 넣는다.
	 arr2 = [camp_id,camp_img,camp_name,camp_addr, memberid];
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

function spag(a) {
	let key='${keyword}';
	var pagenum=a;
    $.ajax({
    	type: 'post',	
    	url: 'search',
    	data: {"key":key,"pagenum":pagenum},
    	error: function (request, error) {
    		alert("fail");
    		console.log("code:"+request.status + "\n" + "message:"+request.responseText+ "\n" + "error:"+error);
    	},
    	success: function (result) {
    		var html = $('<div>').html(result);
    		var contents = html.find("div#indexListAjax").html();
    		$(".camplist_Top").html(contents);
    		if(pagenum>=${page.getEndPage()+1} || ${page.getStartPage()-1}==0){
        		var contents = html.find("div#searchAjax").html();
    			$(".camplist_bottom").html(contents);
    			}

    	}
    });
}
</script>
</head>
<body>
<jsp:include page="header.jsp" flush="true"/>
   <div class="container">
      <div class="camplist_inner">
         <div class="whatever">
         <c:if test="${camp eq '[]' }" >
          <p><strong>"${keyword}</strong>검색 결과가 없습니다</p>
         </c:if>
         <c:if test="${camp ne '[]' }">
				<p><strong>"${keyword}"</strong>통합 검색 결과</p>
				</c:if>
         </div>
         <div class="camplist">
         	<div class="camplist_Top">
            	<c:forEach items="${camp}" var="dto" varStatus="status">
            	<c:if test="${status.count % 3 ==1}">
                	<div class="wrap">
            	</c:if> 
               		<div class="left" id="${dto.camp_id}">
                  		<table class="table_left">
                     		<tr>
                        		<td class="table_img" colspan="2"><c:if test="${dto.camp_img eq 'x'}">
                              		<img style="width: 430px; height: 250px;"
                                 		src="/resources/Img/noimage-black.png"
                                 		onclick="/clist/location.href='cdetail?camp_id=${dto.camp_id}'">
                           </c:if><c:if test="${dto.camp_img ne 'x'}">
                              		<img style="width: 430px; height: 250px;"
                                		src="${dto.camp_img}"
                                 		onclick="location.href='/clist/cdetail?camp_id=${dto.camp_id}&camp_se=${dto.camp_se}&memberid=${sessionScope.memberid}'">
                           </c:if></td>
                     		</tr>
                     		<tr>
                        		<td  class="table_name">${dto.camp_name}</td>
                     		</tr>
                     		<tr>
                        		<td class="table_addr">${fn: substring(dto.camp_addr, 0 ,30)}</td>
                        		<td style="text-align: center;"><button id="${dto.camp_id}"
                              		onclick="compare('${dto.camp_id}' , '${dto.camp_img}' , '${dto.camp_name}' , '${dto.camp_addr}'); return false;">비교</button>
                        		</td>
                     		</tr>
                     		<tr>
                        		<td>&nbsp;</td>
                     		</tr>
                  		</table>
               		</div>
               	<c:if test="${fn:length(calculateList) %2 == 1 and status.count == list.size}">
             </div>
               	</c:if>
            	<c:if test="${status.count % 3 ==0}">
             </div>
               </c:if>
     	 </c:forEach>
      </div>
   </div>
        <div class="camplist_bottom">
      	<div class="pagingDiv">
      		<c:if test="${camp ne '[]' }">
         	<c:if test="${page.prev}">
            	<div onclick="spag(${page.getStartPage()-1});">&laquo;</div>
         	</c:if>
         	<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
            	<div onclick="spag(${idx});">${idx}</div>
         	</c:forEach>
         	<c:if test="${page.next}">
            	<div onclick="spag(${page.getEndPage()+1});">&raquo;</div>
         	</c:if>
         	</c:if>
      	</div>
      	</div>

     <div class="compaer-container" >
     	<div class="compare-inner">
     		 <div class="compare-wrap">     
     		 	<div class="modal">
  					<div class="modal_content" title="클릭하면 창이 닫힙니다.">
    					최대 2개 까지 선택이 가능합니다.
 		 			</div>
				</div>
				<div class="modal-overlap">
  					<div class="modal_content" title="클릭하면 창이 닫힙니다.">
    					같은 숙소를 클릭하셨습니다.<br>
    					다른 숙소를 선택 해주세요.
 		 			</div>
				</div>        		 
     		 	<div class="compare-top-wrap">
     		      <div class="compare-top">
     		      		<div class="cnt_compare">
     		      			비교하기(0)
     		      		</div>
     		      		<div class="cnt_compare_btn">
     		      			<span>비교하기</span>
     		      		</div>
     		      </div>    		      
     		    </div>
     		    <div class="compare-bottom-wrap">    		        		
     		      <div class="compare-bottom">     		      
     		      		<div class="left-compare">
     		      		
     		      			<div class="compare-img">
     		      				<img src="https://gocamping.or.kr/upload/camp/21/thumb/thumb_720_0101P4RZ9jhvwMhT2ZVJUof8.jpg" >
     		      				<div class="close-btn"></div>
     		      			</div>		
     		      			
     		      		<div class="compare-name-addr-wrap">	
     		      		
     		      			<div class="compare-name">
     		      				<span></span>
     		      			</div>
     		      			
     		      			<div class="compare-addr">
     		      				<span></span>
     		      			</div>    		      			
     		      		</div>
     		      		</div>
     		      		<div class="right-compare">
     		      			<div class="compare-img">
     		      				<img src="/resources/img/unknown_img.png" >
     		      				<div class="close-btn"></div>
     		      			</div>     		      		
     		      			<div class="compare-name-addr-wrap">	
     		      				<div class="compare-name">
     		      					<span></span>
     		      				</div>
     		      				<div class="compare-addr">
     		      					<span></span>
     		      				</div>
     		      			</div>
     		      		</div>
     		      </div>
     		    </div>
     		 </div>
     	</div>
     </div>
     <jsp:include page="Footer2.jsp" flush="true"/>
</body>
</html>