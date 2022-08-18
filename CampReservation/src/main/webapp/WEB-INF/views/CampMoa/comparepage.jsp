<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org"
	xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/star.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/banner.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/notice.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Category.css"
	type="text/css">
<link rel="StyleSheet" href="/resources/css/comparedetail.css"
	type="text/css">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lony5bkfmj"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
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
			} ]
		});

		$('.left-item-wrapper').slick({
			dots : false,
			infinite : true,
			speed : 300,
			slidesToShow : 1,
			slidesToScroll : 1,
			responsive : [ {
				breakpoint : 1024,
				settings : {
					slidesToShow : 1,
					slidesToScroll : 1
				}
			} ]
		});
	});
	$(document).ready(function() {
		
		var check1=${check1};
		var check2=${check2};
		if(check1==1){
			$("#l_likeimg").attr("src", "/resources/img/like.png");
			$("#l_likeimg").attr("onclick", "l_like('${sessionScope.memberid}', ${camp.camp_id})");
		}else{
			$("#l_likeimg").attr("src", "/resources/img/unlike.png");
			$("#l_likeimg").attr("onclick", "l_unlike('${sessionScope.memberid}', ${camp.camp_id})");
		}
		if(check2==1){
			$("#r_likeimg").attr("src", "/resources/img/like.png");
			$("#r_likeimg").attr("onclick", "r_like('${sessionScope.memberid}', ${camp_2.camp_id})");
		}else{
			$("#r_likeimg").attr("src", "/resources/img/unlike.png");
			$("#r_likeimg").attr("onclick", "r_unlike('${sessionScope.memberid}', ${camp_2.camp_id})");
		}
		function reloadDivArea() {
			$('.review_container').load(location.href+' .review_container');
			console.log("rtestset");
		}

		function reloadDivArea() {
    		$('.review_wrap').load(location.href+' .review_wrap');
		}


		});
	
	function l_unlike(memberid, campid){
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
	    		$("#l_likeimg").attr("src", "/resources/img/like.png");
	    		$("#l_likeimg").attr("onclick", "l_like('${sessionScope.memberid}', ${camp.camp_id})");
//	    		$("label[for='count']").text(count);
	    		}
	    	}
	    });
	}

	function l_like(memberid, campid){
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
	    		$("#l_likeimg").attr("src", "/resources/img/unlike.png");
	    		$("#l_likeimg").attr("onclick", "l_unlike('${sessionScope.memberid}', ${camp.camp_id})");
//	    		$("label[for='count']").text(count);
	    		}
	    	}
	    });
	}
	
	function r_unlike(memberid, campid){
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
	    		$("#r_likeimg").attr("src", "/resources/img/like.png");
	    		$("#r_likeimg").attr("onclick", "r_like('${sessionScope.memberid}', ${camp_2.camp_id})");
//	    		$("label[for='count']").text(count);
	    		}
	    	}
	    });
	}

	function r_like(memberid, campid){
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
	    		$("#r_likeimg").attr("src", "/resources/img/unlike.png");
	    		$("#r_likeimg").attr("onclick", "r_unlike('${sessionScope.memberid}', ${camp_2.camp_id})");
//	    		$("label[for='count']").text(count);
	    		}
	    	}
	    });
	}
</script>

</head>
<body>
<!-- 
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
 -->	
	<jsp:include page="../header.jsp" flush="true"/>
	<div class="category_name">
			<h1 style="margin-left: 20%;">비교하기</h1>
	</div>
	<!-- 왼쪽 비교 -->
	<div class="img_container">
		<div class="img_inner">
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
											<img src="${dto.img}" style="width:375px; height:250px;"/>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
				</div>
				<div class="left_mid">
					<div class="reservation">
						<button style="width: 80px; height: 35px;" onclick="location.href='campreservation?camp_id=${camp.camp_id}'">예약하기</button>	
					</div>				
					<div class="heart">
						<img id="l_likeimg" style="width: 50px; height: 50px;" src="/resources/Img/unlike.png" onclick="l_unlike('${sessionScope.memberid}', ${camp.camp_id});"> 
					</div>
				</div>
				<div class="left_bottom">
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
							<td class="title">환경</td>
							<td>${camp.camp_loc}</td>
						</tr>
						<tr>
							<td class="title">유형</td>
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
							<td class="title">시설</td>
							<td>${camp.camp_around}</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="right_wrap">
				<div class="right_top">
					<div class="left-item-wrapper">
							<c:choose>
								<c:when test="${empty ci_2 }">
									<c:forEach begin="0" end="10">
										<div class="item">
											<img src="/resources/img/banner/banner_2.jpg" />
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach items="${ci_2}" var="dto">
										<div class="item">
											<img src="${dto.img}" style="width:375px; height:250px;"/>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
				</div>
				<div class="right_mid">
					<div class="reservation">
						<button style="width: 80px; height: 35px;" onclick="location.href='campreservation?camp_id=${camp_2.camp_id}'">예약하기</button>	
					</div>
					<div class="right_heart">
						<img id="r_likeimg" style="width: 50px; height: 50px;" src="/resources/Img/unlike.png" onclick="r_unlike('${sessionScope.memberid}', ${camp_2.camp_id});">
					</div>
				</div>
				<div class="right_bottom">
					<table>
						<tr>
							<td class="title">주소</td>
							<td>${camp_2.camp_addr}</td>
						</tr>
						<tr>
							<td class="title">문의처</td>
							<td>${camp_2.camp_phone}</td>
						</tr>
						<tr>
							<td class="title">환경</td>
							<td>${camp_2.camp_loc}</td>
						</tr>
						<tr>
							<td class="title">유형</td>
							<td>${camp_2.camp_se}</td>
						</tr>
						<tr>
							<td class="title">운영상황</td>
							<td>${camp_2.camp_open}</td>
						</tr>
						<tr>
							<td class="title">운영기간</td>
							<td>${camp_2.camp_open_de}</td>
						</tr>
						<tr>
							<td class="title">운영일</td>
							<td>${camp_2.camp_open_pd}</td>
						</tr>
						<tr>
							<td class="title">홈페이지</td>
							<td><a href="${camp_2.camp_web}" target="_blank">${camp_2.camp_web}</a></td>
						</tr>
						<tr>
							<td class="title">시설</td>
							<td>${camp_2.camp_around}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="review" style="width: 100%; height: 400px">
		<h1 style="margin-left: 20%;">후 기</h1>
		<div class="review_container">
			<div class="review_wrap">
				<div class="review_content">
					<img class="wordcloud_img"  onerror="this.src='/resources/img/world_cloud_error.png';setTimeout(function(){$('.review_container').load(location.href+' .review_container');}, 3000);" src="/resources/img/wordcloud/wordcloud_id-${camp.camp_id}.png" style="width :350px; height:350px;">
				</div>
				<div class="review_content">
					<img class="wordcloud_img" onerror="this.src='/resources/img/world_cloud_error.png';setTimeout(function(){$('.review_container').load(location.href+' .review_container');}, 3000);	" alt=""  src="/resources/img/wordcloud/wordcloud_id-${camp_2.camp_id}.png" style="width :350px; height:350px;">
				</div>
			</div>
		</div>
	</div>
	
	<div>
		<h1 style="margin-left: 20%;">오시는 길</h1>
		<div id="map" style="width:60%;height:500px; margin: auto;"></div>
	</div>
	
		<div class="notice_container">
		<div class="notice_inner" 	style="width: 72%;">
			<div class="notice_wrap">
				<div class="notice_top">
					<h1 style="margin-left: 4%;">추천 캠핑장</h1>
					<div class="slider">
						<div class="item-wrapper">
							<c:choose>
								<c:when test="${empty CR}">
									<c:forEach begin="0" end="10">
										<div class="item">
											<img src="/resources/img/banner/banner_2.jpg" />
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach begin="0" end="9" items="${CR}" var="dto">
										<div class="item">
											<a class="test" onclick="location.href='cdetail?camp_id=${dto.camp_id}&camp_se=${dto.camp_se}&memberid=${sessionScope.memberid}'"> ${dto.camp_name } </a>
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
	<jsp:include page="../Footer2.jsp" flush="true"/>
	<script>
	$(document).ready(function (){
		initMap();
	});
	function initMap() { 
		  var areaArr = new Array();  // 지역을 담는 배열 ( 지역명/위도경도 )
		  areaArr.push(
		          /*지역구 이름*/			/*위도*/					/*경도*/				
		      {location : '${camp.camp_name}' , lat : '${camp.camp_long};' , lng : '${camp.camp_lat}' , addr: '${camp.camp_addr}'},  // 강남구 중심좌표
       		  {location : '${camp_2.camp_name}' , lat : '${camp_2.camp_long};' , lng : '${camp_2.camp_lat}', addr: '${camp_2.camp_addr}'},  // 강동구 중심좌표
		  );
		  
		  let markers = new Array(); // 마커 정보를 담는 배열
		  let infoWindows = new Array(); // 정보창을 담는 배열
		  
		  var map = new naver.maps.Map('map', {
		      center: new naver.maps.LatLng(36.38, 127.51), //지도 시작 지점
		      zoom: 4
		  });
		  
		  for (var i = 0; i < areaArr.length; i++) {
		      // 지역을 담은 배열의 길이만큼 for문으로 마커와 정보창을 채워주자 !

		      var marker = new naver.maps.Marker({
		          map: map,
		          title: areaArr[i].location, // 지역구 이름 
		          position: new naver.maps.LatLng(areaArr[i].lat , areaArr[i].lng) // 지역구의 위도 경도 넣기 
		      });
		      
		      /* 정보창 */
		       var infoWindow = new naver.maps.InfoWindow({
		           content: '<div style="width:200px;text-align:center;padding:10px; color:black;"><b style="color:black;">' + areaArr[i].location + '</b><br>'+ areaArr[i].addr+ '</div>'
		       }); // 클릭했을 때 띄워줄 정보 HTML 작성
		      
		       markers.push(marker); // 생성한 마커를 배열에 담는다.
		       infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다.
		  }
		  
		   
		  function getClickHandler(seq) {
		      
		          return function(e) {  // 마커를 클릭하는 부분
		              var marker = markers[seq], // 클릭한 마커의 시퀀스로 찾는다.
		                  infoWindow = infoWindows[seq]; // 클릭한 마커의 시퀀스로 찾는다

		              if (infoWindow.getMap()) {
		                  infoWindow.close();
		              } else {
		                  infoWindow.open(map, marker); // 표출
		              }
		          }
		      }
		  
		  for (var i=0, ii=markers.length; i<ii; i++) {
		      naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러
		  }
		}
	
	</script>

</body>
</html>