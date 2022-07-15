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
<link rel="StyleSheet" href="css/Main.css" type="text/css">
<link rel="StyleSheet" href="css/star.css" type="text/css">
<link rel="StyleSheet" href="css/banner.css" type="text/css">
<link rel="StyleSheet" href="css/notice.css" type="text/css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="js/star.js"></script>
</head>
<body>
	<div class="header">
		<div class="section">
			<div class="logo">
				<a href="/"><img alt="" src="img/logo/logo (2).png"
					style="height: 100px;"></a>
			</div>
			<div class="nav">
				<ul style="padding-inline-start: 0px;">
					<li class="nav-item-search">
						<form action="" style="margin-left: 0px;">
							<img class="search-icon" style="width: 64px; height: 64px;"
								src="img/search.svg"> <input class="search-form"
								type="text" placeholder="통합검색"> <span class="underline"></span>
						</form>
					</li>
					<li class="nav-item"><a href="/camplist">캠핑장</a></li>
					<li class="nav-item"><a href="/glamlist">글램핑</a></li>
					<li class="nav-item"><a href="/caravanlist">카라반</a></li>
					<li class="nav-item"><a href="/usedtradelist">중고거래</a></li>
					<li class="nav-item"><a href="/communitylist">커뮤니티</a></li>
					<li class="nav-item"><a href="/DB/CampDb">db</a></li>
				</ul>
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
					<h1>국내 여행</h1>
					<div class="slider">
						<div class="slider-btn-wrapper slider-btn-wrapper-left">
							<!-- 왼쪽 화살표 -->
							<h1>&lt;</h1>
						</div>
						<div class="item-wrapper">
							<div class="item">
								<img src="img/banner/banner_2.jpg" />
							</div>
							<div class="item">
								<img src="img/banner/banner_2.jpg" />
							</div>
							<div class="item">
								<img src="img/banner/banner_2.jpg" />
							</div>
							<div class="item">
								<img src="img/banner/banner_2.jpg" />
							</div>
						</div>
						<div class="slider-btn-wrapper slider-btn-wrapper-right">
							<h1>&gt;</h1>
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