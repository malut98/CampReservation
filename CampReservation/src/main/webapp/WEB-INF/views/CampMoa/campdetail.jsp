<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/star.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/banner.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/notice.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Category.css"
	type="text/css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lony5bkfmj"></script>
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
				slidesToShow : 1,
				slidesToScroll : 1
			}
		}]
	});
});
$(document).ready(function () {
	var like_count=${count};
	var check=${check};
	
	if(check==1){
		$("#likeimg").attr("src", "/resources/img/like.png");
		$("#likeimg").attr("onclick", "like('${sessionScope.memberid}', ${camp.camp_id})");
	}else{
		$("#likeimg").attr("src", "/resources/img/unlike.png");
		$("#likeimg").attr("onclick", "unlike('${sessionScope.memberid}', ${camp.camp_id})");
	}
	});
	
function unlike(memberid, campid){
	$.ajax({
		type: 'post',	
    	url: '/ht/unheart',
    	data: {"memberid":memberid, "campid":campid},
    	error: function (request, error) {
    		alert("fail");
    		console.log("code:"+request.status + "\n" + "message:"+request.responseText+ "\n" + "error:"+error);
    	},
    	success: function (count) {
    		if(count==-1){
    			alert("로그인 후 이용 가능합니다.");
    		}else{
    		$("#likeimg").attr("src", "/resources/img/like.png");
    		$("#likeimg").attr("onclick", "like('${sessionScope.memberid}', ${camp.camp_id})");
    		$("label[for='count']").text(count);
    		}
    	}
    });
}

function like(memberid, campid){
	$.ajax({
		type: 'post',	
    	url: '/ht/heart',
    	data: {"memberid":memberid, "campid":campid},
    	error: function (request, error) {
    		alert("fail");
    		console.log("code:"+request.status + "\n" + "message:"+request.responseText+ "\n" + "error:"+error);
    	},
    	success: function (count) {
    		if(count==-1){
    			alert("로그인 후 이용 가능합니다.");
    		}else{
    		$("#likeimg").attr("src", "/resources/img/unlike.png");
    		$("#likeimg").attr("onclick", "unlike('${sessionScope.memberid}', ${camp.camp_id})");
    		$("label[for='count']").text(count);
    		}
    	}
    });
}

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
			height:2100px;
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
						<li class="nav-item"><a href="/clist/cpl">캠핑모아</a></li>
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
				<img id="likeimg" style="width: 50px; height: 50px;" src="/resources/Img/unlike.png" onclick="unlike('${sessionScope.memberid}', ${camp.camp_id});">
				<label for="count">${count }</label>
			</div>
			<div class="reservation">
				<button style="width : 80px; height : 35px;">예약하기</button>
			</div>
		</div>
		<div class="notice_container" style="height:300px;">
		<div class="notice_inner" style="width: 90%; height:300px;">
			<div class="notice_wrap" style="height:300px;">
				<div class="notice_top" style="height:300px;">
					<div class="slider">
						<div class="item-wrapper">
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
											<img src="${dto.img}" style="width:375px; height:250px;"/>
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
	<h1 style="margin-left: 20%;">오시는 길</h1>
	<div id="map" style="width:1000px;height:500px; margin: auto;"></div>
	<div class="notice_container">
		<div class="notice_inner" 	style="width: 72%;">
			<div class="notice_wrap">
				<div class="notice_top">
					<h1>추천 캠핑장</h1>
					<div class="slider	">
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
	</div>
	<div class="footer">
		<div class="floresta">
			<!-- <img style=""
				src="https://raw.githubusercontent.com/interaminense/starry-sky/master/src/img/bgTree.png"
				alt="" />  -->
		</div>
	</div>
<script>
	var HOME_PATH = window.HOME_PATH || '.';
	var lat=${camp.camp_lat};
	var lon=${camp.camp_long};
	var mapOptions = {
    center: new naver.maps.LatLng(lon, lat),
    zoom: 17
	};
	var map = new naver.maps.Map('map', mapOptions);
	
	var marker = new naver.maps.Marker({
	    position: new naver.maps.LatLng(lon, lat),
	    map: map
	});
	var contentString = [
        '<div class="iw_inner">',
        '   <h3 style="color:black;">${camp.camp_name}</h3>',
        '   <p style="color:black;">${camp.camp_addr}<br />',
        '       <a href="${camp.camp_web}" target="_blank" style="color:black;">&nbsp;${camp.camp_web}&nbsp;</a>',
        '   </p>',
        '</div>'
    ].join('');

	var infowindow = new naver.maps.InfoWindow({
    	content: contentString
	});

	naver.maps.Event.addListener(marker, "click", function(e) {
    	if (infowindow.getMap()) {
        	infowindow.close();
    	} else {
        	infowindow.open(map, marker);
    	}
	});

	infowindow.open(map, marker);
</script>

</body>
</html>