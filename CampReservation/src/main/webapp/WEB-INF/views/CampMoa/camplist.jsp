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
<script type="text/javascript" src="/resources/js/compare.js"></script>
<script type="text/javascript">
function pag(a) {
	var pagenum=a;
    $.ajax({
    	type: 'post',	
    	url: 'pagin',
    	data: {"pagenum":pagenum,"name":'${tag}'},
    	error: function (request, error) {
    		alert("fail");
    		console.log("code:"+request.status + "\n" + "message:"+request.responseText+ "\n" + "error:"+error);
    	},
    	success: function (result) {
    		var html = $('<div>').html(result);
    		var contents = html.find("div#indexListAjax").html();
    		$(".camplist_Top").html(contents);
    		if(pagenum>=${page.getEndPage()+1} || ${page.getStartPage()-1}==0){
        		var contents = html.find("div#indexListAjax2").html();
    			$(".camplist_bottom").html(contents);
    		}
    	}
    });
}
function spag(a) {
	let key=$(".key").val();
	var pagenum=a;
    $.ajax({
    	type: 'post',	
    	url: 'Campsearch',
    	data: {"key":key,"pagenum":pagenum,"name":'${tag}'},
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
function search() {
	let key=$(".key").val();
    $.ajax({
    	type: 'post',	
    	url: 'Campsearch',
    	data: {"key":key,"name":'${tag}'},
    	error: function (request, error) {
    		alert("fail");
    		console.log("code:"+request.status + "\n" + "message:"+request.responseText+ "\n" + "error:"+error);
    	},
    	success: function (result) {
    		var html = $('<div>').html(result);
    		var contents = html.find("div#indexListAjax").html();
    		$(".camplist_Top").html(contents);
        	var contents = html.find("div#searchAjax").html();
    		$(".camplist_bottom").html(contents);
    	}
    });
}

</script>
</head>
<body>
<%
	String id = (String)session.getAttribute("memberid");
%>
   <div class="header">
      <div class="section">
         <div class="logo">
            <a href="/"><img alt="" src="/resources/img/logo/logo (2).png"
               style="height: 100px;"></a>
         </div>
         <div class="nav-item-search">
            <form class="form-tag" action="" style="">
               <img class="search-icon" style="width: 64px; height: 64px;"
                  src="/resources/img/search.svg"> <input class="search-form"
                  type="text" placeholder="통합검색"> <span class="underline"></span>
            </form>
         </div>
         <div class="nav_wrap">
            <div class="nav">
               <ul class="header_menu">
                  <li class="nav-item"><a href="/clist/ca">캠핑모아</a></li>
                  <li class="nav-item"><a href="/usedtradelist">중고모아</a></li>
                  <li class="nav-item"><a href="/communitylist">커뮤모아</a></li>
                  		<%
							if(id!=null){
						%>
						<li class="nav-item"><a href="/mypage">마이페이지</a></li>
						<%
							}
						%>
               </ul>
            </div>
         </div>
         <div class="menu_pan">
            <div class="camp-moa">
               <div class="menu_category">
                  <div class="category">
						<a href="/clist/best"> 베스트 모아</a>
					</div>
					<div class="category">
						<a href=""> 새로움 모아</a>
					</div>
					<div class="category">
						<a href="/clist/cpl"> 캠핑장 모아</a>
					</div>
					<div class="category">
						<a href="/clist/cvl"> 카라반 모아</a>
					</div>
					<div class="category">
						<a href="/clist/gl"> 글램핑 모아</a>
					</div>
					<div class="category">
						<a href="/clist/pet"> 반려견 모아</a>
					</div>
               </div>
            </div>
         </div>
         <div class="profile">
           <ul>
				<%
				if(id==null){
				%>
					<li><a id="login" href="/login">로그인</a></li>
				<%			
					}else{
				%>		
					<li><a id="logout" href="/logout">로그아웃</a></li>
				<%		
					}
				%>
				</ul>
         </div>
      </div>
   </div>

   <div class="container">
      <div class="camplist_inner">
         <div class="whatever">
         	<h1>${tag}</h1>
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
                                 		onclick="location.href='cdetail?camp_id=${dto.camp_id}'">
                           </c:if><c:if test="${dto.camp_img ne 'x'}">
                              		<img style="width: 430px; height: 250px;"
                                		src="${dto.camp_img}"
                                 		onclick="location.href='cdetail?camp_id=${dto.camp_id}&camp_se=${dto.camp_se}&memberid=${sessionScope.memberid}'">
                           </c:if></td>
                     		</tr>
                     		<tr>
                        		<td  class="table_name">${dto.camp_name}</td>
                     		</tr>
                     		<tr>
                        		<td class="table_addr">${dto.camp_addr}</td>
                        		<td style="text-align: center;"><button id="${dto.camp_id}"
                              		onclick="compare('${dto.camp_id}' , '${dto.camp_img}' , '${dto.camp_name}' , '${dto.camp_addr}','${sessionScope.memberid}'); return false;">비교</button>
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
   		<div style="text-align: center;">
			<input class="key" type="text" placeholder="검색어를 입력해주세요">
			<input class="se" type="button" value="검색" onclick="search();">
		</div>
        <div class="camplist_bottom">
      	<div class="pagingDiv">
         	<c:if test="${page.prev}">
            	<div onclick="pag(${page.getStartPage()-1});">&laquo;</div>
         	</c:if>
         	<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
            	<div onclick="pag(${idx});">${idx}</div>
         	</c:forEach>
         	<c:if test="${page.next}">
            	<div onclick="pag(${page.getEndPage()+1});">&raquo;</div>
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
</body>
</html>