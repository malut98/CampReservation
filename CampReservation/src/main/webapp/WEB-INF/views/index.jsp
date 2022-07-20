<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/star.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/banner.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/notice.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Category.css"
	type="text/css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/star.js"></script>
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
					src="/resources/img/search.svg"> 
					<input class="search-form" type="text" placeholder="통합검색"> 
					<span class="underline"></span>
				</form>
			</div>
			<div class="nav_wrap">
				<div class="nav">
					<ul class="header_menu">
						<li class="nav-item"><a href="/camplist">캠핑모아</a></li>
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
					<li><a href="/login">로그인</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="noite">
		<div class="Banner_container">
			<div class="Banner_inner" style="">
				<div class="Banner_warp">
					<div class="Top_wrap">
						<div class="Banner_Top">
							<div class="Banner Text">
								<h2>Hello, I'm Camp Moa</h2>
							</div>
						</div>
					</div>
					<div class="Bottom_warp">
						<div class="Banner_Bottom">
							<button class="Banner-btn">산</button>
							<button class="Banner-btn">바다</button>
							<button class="Banner-btn">캠핑장</button>
							<button class="Banner-btn">글램핑</button>
							<button class="Banner-btn">카라반</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="constelacao"></div>

	<div class="lua">
		<div class="textura"></div>
	</div>

	<div class="chuvaMeteoro"></div>

	<div class="notice_container">
		<div class="notice_inner">
			<div class="notice_wrap">
				<div class="notice_top">
					<h1>추천 캠핑장</h1>
					<div class="slider">
						<div class="item-wrapper">
							<c:choose>
								<c:when test="${empty list }">
									<c:forEach begin="0" end="8">
										<div class="item">
											<img src="/resources/img/banner/banner_2.jpg" />
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach begin="0" end="8" items="${list }" var="dto">
										<div class="item">
											<a class="test"> ${dto.camp_name } </a>
											<div class="test-2">
												<a><img src="${dto.camp_img }" /></a>
											</div>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="notice_bottom_wrap">
							<div class="notice_bottom"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="footer">
		<div class="floresta">
			<!-- <img style=""
				src="https://raw.githubusercontent.com/interaminense/starry-sky/master/src/img/bgTree.png"
				alt="" />  -->
		</div>
	</div>
</body>
</html>