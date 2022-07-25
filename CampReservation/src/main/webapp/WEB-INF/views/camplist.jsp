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
function pag(a) {
	var pagenum=a;
    $.ajax({
    	type: 'GET',	
    	url: '/clist/pagin',
    	data: {"pagenum":pagenum},
    	error: function (request, error) {
    		alert("fail");
    		console.log("code:"+request.status + "\n" + "message:"+request.responseText+ "\n" + "error:"+error);
    	},
    	success: function (result) {
    		var html = jQuery('<div>').html(result);
    		var contents = html.find("div#indexListAjax").html();
    		console.log(html);
    		console.log(contents);
    		$(".camplist_inner").empty();
    		$(".camplist_inner").html(contents);
    		
    	}
    });
}
   function compare(camp_id, camp_img, camp_name, camp_addr) {
      // 받아야하는 값 dto.camp_id/dto.camp_img/dto.camp_name/dto.camp_addr
      // 1. 버튼을 누르면 비교 div를 display none;에서 block;으로 바꾼다
      // 
      console.log(camp_id + " " + camp_img + " " + camp_name + " "
            + camp_addr);

   }
</script>
</head>
<body>
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
                  <li class="nav-item"><a href="/clist/cpl">캠핑모아</a></li>
                  <li class="nav-item"><a href="/usedtradelist">중고모아</a></li>
                  <li class="nav-item"><a href="/communitylist">커뮤모아</a></li>
               </ul>
            </div>
         </div>
         <div class="menu_pan">
            <div class="camp-moa">
               <div class="menu_category">
                  <div class="category">
                     <a href=""> 베스트 모아</a>
                  </div>
                  <div class="category">
                     <a href=""> 새로움 모아</a>
                  </div>
                  <div class="category">
                     <a href=""> 캠핑장 모아</a>
                  </div>
                  <div class="category">
                     <a href=""> 카라반 모아</a>
                  </div>
                  <div class="category">
                     <a href=""> 글램핑 모아</a>
                  </div>
                  <div class="category">
                     <a href=""> 반려견 모아</a>
                  </div>
               </div>
            </div>
         </div>
         <div class="profile">
            <ul>
               <li><a href="/resources/login">로그인</a></li>
            </ul>
         </div>
      </div>
   </div>

   <div class="container">
      <div class="camplist_inner">
         <div class="whatever">
         	<h1>캠핑장</h1>
         </div>
         <div class="camplist">
         	<div class="camplist_Top">
            	<c:forEach items="${camp}" var="dto" varStatus="status">
            	<c:if test="${status.count % 2 ==1 or status.count == 1}">
                	<div id="wrap">
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
                                 		onclick="location.href='cdetail?camp_id=${dto.camp_id}'">
                           </c:if></td>
                     		</tr>
                     		<tr>
                        		<td  class="table_name">${dto.camp_name}</td>
                        		<td style="text-align: center;"><img
                          			style="width: 20px; height: 20px;"
                           			src="/resources/Img/unlike.png"></td>
                     		</tr>
                     		<tr>
                        		<td class="table_addr">${dto.camp_addr}</td>
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
            	<c:if test="${status.count % 2 ==0}">
             </div>
               </c:if>
     	 </c:forEach>
      </div>
   </div>

        <div class="camplist_bottom">
      	<div class="pagingDiv">
         	<c:if test="${page.prev}">
            	<a href="?pagenum=${page.getStartPage()-1}">&laquo;</a>
         	</c:if>
         	<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
            	<div onclick="pag(${idx});">${idx}</div>
         	</c:forEach>
         	<c:if test="${page.next}">
            	<a href="?pagenum=${page.getEndPage()+1}">&raquo;</a>
         	</c:if>
      </div>
      </div>
</body>
</html>