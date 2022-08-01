<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="StyleSheet" href="/resources/css/compare.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Category.css"
	type="text/css">
<script type="text/javascript" src="/resources/js/star.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="/resources/js/category.js"></script>
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
						<li class="nav-item"><a href="/clist/ca">캠핑모아</a></li>
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
							<a href="/clist/cpl"> 캠핑장 모아</a>
						</div>
						<div class="category">
							<a href="/clist/cvl"> 카라반 모아</a>
						</div>
						<div class="category">
							<a href="/clist/gl"> 글램핑 모아</a>
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

	<div class="category_name">
		<h1 style="margin-left: 20%;">비교하기</h1>
	</div>

	<div class="reserv_container" style="width: 100%; height: 500px;">
		<div class="reserv_inner">
			<div>
				<div class="left_wrap">
					<div class="left_top">
						<div class="left-item-wrapper" style="max-width: 500px">
							<c:choose>
								<c:when test="${empty ci }">
									<c:forEach begin="0" end="10">
										<div class="item">
											<img src="/resources/img/banner/banner_2.jpg" />
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach items="${ci}" var="dto">
										<div class="item">
											<img src="${dto.img}" style="width: 375px; height: 250px;" />
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>