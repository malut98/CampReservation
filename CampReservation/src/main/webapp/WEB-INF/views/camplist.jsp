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
			top-padding: 10%;
			text-align : center;
		}
		
		.camplist{
			width:100%;
			height: 1400px;
		}
		
		.left{
			width:45%;
			text-align : left;
			float: left;
		}
		.right{
			width:45%;
			float: right;
		}
		.table_left{
			float : right;
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
							<a href="/clist/gl"> 캠핑장 모아</a>
						</div>
						<div class="category">
							<a href="/clist/cvl"> 카라반 모아</a>
						</div>
						<div class="category">
							<a href="/clist/cpl"> 글램핑 모아</a>
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
	<br><br><br>
	<h1>캠핑장</h1>
	<div class="camplist">	
		<c:forEach items="${camp}" var="dto" varStatus="status">
			<c:if test="${status.count%2 == '1'}">
				<div class="left">
					<table class="table_left">
						<tr>
							<td colspan="2">
							<c:if test="${dto.camp_img eq 'x'}">
								<img style="width: 540px; height: 350px;"
								src="https://pbs.twimg.com/media/Et8y5ArVcAYlA28.jpg:large"
								onclick="location.href='cdetail?camp_id=${dto.camp_id}'"></c:if>
								
							<c:if test="${dto.camp_img ne 'x'}">
								<img style="width: 540px; height: 350px;"
								src="${dto.camp_img}" onclick="location.href='cdetail?camp_id=${dto.camp_id}'"></c:if>
							</td>
						</tr>
						<tr>
							<td>${dto.camp_name}</td>
							<td style="text-align: center;"><img style="width: 20px; height: 20px;"
								src="/resources/Img/unlike.png"></td>
						</tr>
						<tr>
							<td>${dto.camp_addr}</td>
							<td style="text-align: center;"><button>비교</button><td>
						</tr>
						<tr><td>&nbsp;</td></tr>
					</table>
				</div>
			</c:if>
			<c:if test="${status.count%2 == '0'}">
				<div class="right">
					<table class="table_right">
						<tr>
							<td colspan="2">
							<c:if test="${dto.camp_img eq 'x'}">
								<img style="width: 540px; height: 350px;"
								src="https://pbs.twimg.com/media/Et8y5ArVcAYlA28.jpg:large"
								onclick="location.href='cdetail?camp_id=${dto.camp_id}'"></c:if>
								
							<c:if test="${dto.camp_img ne 'x'}">
								<img style="width: 540px; height: 350px;"
								src="${dto.camp_img}" onclick="location.href='cdetail?camp_id=${dto.camp_id}'"></c:if>
							</td>
						</tr>
						<tr>
							<td>${dto.camp_name}</td>
							<td style="text-align: center;"><img style="width: 20px; height: 20px;"
								src="/resources/Img/unlike.png"></td>
						</tr>
						<tr>
							<td>${dto.camp_addr}</td>
							<td style="text-align: center;"><button>비교</button><td>
						</tr>
						<tr><td>&nbsp;</td></tr>
					</table>
				</div>
			</c:if>
		</c:forEach>
		<div class="paging">
			<c:if test="${page.prev}">
            	<a href="?pagenum=${page.getStartPage()-1}">&laquo;</a>
            </c:if>
                <c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
                	<a href="?pagenum=${idx}">${idx}</a>
                </c:forEach>
            <c:if test="${page.next}">
                    <a href="?pagenum=${page.getEndPage()+1}">&raquo;</a>
            </c:if>
		</div>
	</div>
</body>
</html>