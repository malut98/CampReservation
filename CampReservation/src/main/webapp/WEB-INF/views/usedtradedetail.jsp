<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/notice.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Category.css"
	type="text/css">
<link rel="stylesheet" type="text/css" href="/resources/css/usedtradedetail.css"/>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/star.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script src="/resources/js/category.js"></script>
<script>
	window.onload=function(){
		var mesage = "${mesage}";
		console.log(mesage);
		
		if(mesage =="작성자"){
			$("#boardupdate").show();
			$("#boarddelete").show();
		}
		else if(mesage == "관리자"){
			$("#boarddelete").show();
		}
	}
	$(function() {
		$('.item-wrapper').slick({
			dots : false,
			infinite : true,
			speed : 300,
			slidesToShow : 4,
			slidesToScroll : 2,
			responsive : [ {
				breakpoint : 1024,
				settings : {
					slidesToShow : 3,
					slidesToScroll : 3
				}
			}
			// You can unslick at a given breakpoint now by adding:
			// settings: "unslick"
			// instead of a settings object
			]
		});
	});
	
</script>
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
						<li class="nav-item"><a href="/clist/cpl">캠핑모아</a></li>
						<li class="nav-item"><a href="/usedtradelist">중고모아</a></li>
						<li class="nav-item"><a href="/communitylist">커뮤모아</a></li>
						<!-- <li class="nav-item"><a href="/DB/CampImg">db</a></li> -->
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
	<div class="body">
	 <input type="button" value="&lt;" id="menubutton" onclick="location.href='usedtradelist'">
	 <label for="menubutton" id="mb">&lt;</label>
	 <div class="usedtradeboard">
	 <div class="boardimage">
	 <img src="/resources/Img/usedtrade/${dto.mar_image }" class="Thumbnail">
	 </div>
	 	<span>제목</span> <input type="text" name="mar_title" id="ut" readonly="readonly" value="${dto.mar_title }"><br>
	 	<span>작성자</span> <input type="text" name="member_id" readonly="readonly" id="member" value="${dto.member_id }"><br>
	 	<span>연락처</span> <input type="text" name="mar_name" id="un" readonly="readonly" value="${dto.mar_name }"><br>
	 	<span>가격</span> <input type="number" name="mar_price" id="up" readonly="readonly" value="${dto.mar_price }"><br>
	 	<span>설명</span> <textarea rows="10" cols="50" name="mar_content" id="uc" readonly="readonly" >${dto.mar_content }</textarea>
	 
	 </div>
	 <div class="boardbutton">
	 <input type="button" value="수정" id="boardupdate" onclick="location.href='usedtradeupdate?mar_num=${dto.mar_num}'">
	 <input type="button" value="삭제" id="boarddelete" onclick="location.href='usedtradedelete?mar_num=${dto.mar_num}&mar_image=${dto.mar_image}'">
	 </div>
	</div>
</body>
</html>