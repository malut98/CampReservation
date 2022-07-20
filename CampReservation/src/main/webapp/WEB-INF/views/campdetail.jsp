<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/star.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/banner.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/notice.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Category.css"
	type="text/css">
<script type="text/javascript" src="/resources/js/star.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script src="/resources/js/category.js"></script>
<script type="text/javascript">
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
	<style>
		h1{
			margin-top: 4%;
			margin-left: 7%;
		}
		.img{
			width:45%;
			margin-left: 7%;
			text-align : left;
			float: left;
		}
		.cont{
			width: 100%;
			height:1500px;
		}
		.c_table{
			width:45%;
			float: right;
		}
		
		.title{
			width:40%;
		}
		tr{
			height: 48px;
		}
		.heart{
			margin-left: 7%;
			float:left;
			width: 605px;
		}
		.reservation{
			float : left;
		}
	</style>
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
					src="/resources/img/search.svg"> 
					<input class="search-form" type="text" placeholder="통합검색"> 
					<span class="underline"></span>
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
	<div class="cont">
		<div class="name">
			<h1>${camp.camp_name}</h1>
		</div>
		<div class="img">
			<c:if test="${camp.camp_img eq 'x'}">
				<img style="width: 700px; height: 440px;"
					src="https://pbs.twimg.com/media/Et8y5ArVcAYlA28.jpg:large"></c:if>		
			<c:if test="${camp.camp_img ne 'x'}">
				<img style="width: 700px; height: 440px;" src="${camp.camp_img}"></c:if>
		</div>
		<div class="c_table">
			<table>
				<tr>
					<td class="title">주소</td>
					<td>${camp.camp_addr}</td>
				</tr>
				<tr>
					<td class="title">문의처</td>
					<td>${camp.camp_phone}</td>
				</tr>
				<tr>
					<td class="title">캠핑장 환경</td>
					<td>${camp.camp_loc}</td>
				</tr>
				<tr>
					<td class="title">캠핑장 유형</td>
					<td>${camp.camp_se}</td>
				</tr>
				<tr>
					<td class="title">운영상황</td>
					<td>${camp.camp_open}</td>
				</tr>
				<tr>
					<td class="title">운영기간</td>
					<td>${camp.camp_open_de}</td>
				</tr>
				<tr>
					<td class="title">운영일</td>
					<td>${camp.camp_open_pd}</td>
				</tr>
				<tr>
					<td class="title">홈페이지</td>
					<td><a href="${camp.camp_web}" target="_blank">${camp.camp_web}</a></td>
				</tr>
				<tr>
					<td class="title">주변이용가능시설</td>
					<td>${camp.camp_around}</td>
				</tr>
			</table>
		</div>
		<div style="width: 100%">
			<div class="heart">
				<img style="width: 50px; height: 50px;"src="/resources/Img/unlike.png">
			</div>
			<div class="reservation">
				<button style="width : 80px; height : 35px;">예약하기</button>
			</div>
		</div>
		
		
	</div>
</body>
</html>