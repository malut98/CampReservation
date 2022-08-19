<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CampMoa</title>
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/star.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/banner.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/notice.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Category.css"type="text/css">
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
	<jsp:include page="header.jsp" flush="true"/>

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
							<button onclick="location.href='serch?keyword=산'" class="Banner-btn">산</button>
							<button onclick="location.href='serch?keyword=바다'" class="Banner-btn">바다</button>
							<button onclick="location.href='serch?keyword=캠핑장'" class="Banner-btn">캠핑장</button>
							<button onclick="location.href='serch?keyword=글램핑'" class="Banner-btn">글램핑</button>
							<button onclick="location.href='serch?keyword=카라반'" class="Banner-btn">카라반</button>
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
		<div class="notice_inner" 	style="width: 72%;">
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
											<a href="/clist/cdetail?camp_id=${dto.camp_id}" class="test"> ${dto.camp_name } </a>
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

	<jsp:include page="Footer2.jsp" flush="true"/>
</body>
</html>