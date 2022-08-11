
<%@page import="com.camp.campreservation.Dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/banner.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/notice.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Category.css"
	type="text/css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script src="/resources/js/category.js"></script>
<script>
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
function wtype(){
	
}
</script>
<style>
body{
	background-color:black;
}
.myinfomation{
   width:20%;
   float:left;
   margin-left:20%;
   text-align:left;
   font-weight: bold;
}
.likelist{
	width:40%;
	height:130px;
	float:right;
	margin-right:200px;
	background-color: lightgray;	
	text-align:center;
}
.camplike{
	float:right;
}
.camplike > table{
	width: 75%; 
	height:150px;
	border: 1px solid white;
	margin-right:665px;
	border: 1px solid white;
}
.scroll{
	overflow: scroll;
}
.scroll>tr>td{
	padding-left: 30px;
	width: 300px;
}
.reviewlist{
	padding-top : 300px;
	padding-left: 300px;
}
.review_list{
	width: 1030px;
	height: 50px;
	background-color:lightgray;
}
h2{	
	color: white;
	padding-right:800px;
	font-size: 25pt;
	text-align: center;
}

input{
	border: solid 1px white;
	border-radius: 10px;

}

</style>
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
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
					src="/resources/img/search.svg"> 
					<input class="search-form" type="text" placeholder="통합검색"> 
					<span class="underline"></span>
				</form>
			</div>
			<div class="nav_wrap">
				<div class="nav">
					<ul class="header_menu">
						<li class="nav-item"><a href="/clist/ca?${sessionScope.memberid}">캠핑모아</a></li>
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
							<a href=""> 베스트 모아</a>
						</div>
						<div class="category">
							<a href=""> 새로움 모아</a>
						</div>
						<div class="category">
							<a href="/clist/cpl?${sessionScope.memberid}"> 캠핑장 모아</a>
						</div>
						<div class="category">
							<a href="/clist/cvl?${sessionScope.memberid}"> 카라반 모아</a>
						</div>
						<div class="category">
							<a href="/clist/gl?${sessionScope.memberid}"> 글램핑 모아</a>
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
		
	<div class="mypagemain">
		<h2>마이페이지</h2>
		<div class="myinfomation">
		<table>
			<tr>
				<td>이름</td>
			</tr>
			<tr>
				<td><input type="text" id="memberphone" name="memberphone" readonly="readonly" value="${dto.membername }" style="width:250px;height:40px; color:black;"></td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
			</tr>
			<tr>
				<td><input type="text" id="memberphone" name="memberphone" readonly="readonly" value="${dto.memberphone }" style="width:250px;height:40px; color:black;"></td>
			</tr>
			<tr>
				<td>선호날씨</td>
			</tr>
			<tr>	
				<td><input type="button" id="Wtype" name="Wtype"  value="맑음,흐림,비,눈" style="width:250px;height:40px; color:black;" onclick="wtype();"></td>
			</tr>
			<tr>
				<td>보유 포인트</td>
			</tr>
			<tr>	
				<td><input type="text" id="pointer" name="pointer" readonly="readonly" value="${dto.pointer }" style="width:250px;height:40px; color:black;"></td>
			</tr>
		</table>
		</div>
		<div class="like">
			<div class="likelist">
				<h3>좋아요 리스트</h3>
			</div>
			<div class="camplike">
				<table class="scroll" style="">
					<tr>
						<td>캠핑장</td>
						<td>주소</td>
						<td>좋아요</td>
					</tr>
				</table>
			</div>
		</div>	
		<div class="reviewlist" style="line-height:50%;">
			<table class="review_list">			
				<tr>
					<th>예약완료</th>
					<th>이용완료</th>
					<th>후기작성</th>
				</tr>
			</table>
			
		</div>		
	</div>
</body>