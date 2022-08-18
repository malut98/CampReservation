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
<link rel="StyleSheet" href="/resources/css/notice.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Category.css"
	type="text/css">
	<link rel="StyleSheet" href="/resources/css/banner.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/star.css" type="text/css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/usedtradelist.css" />
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
	window.onload = function() {
		var mesage = "${mesage}";
		var uList = "${uList}";
		console.log(uList);
		if(uList =="[]"){
			$(".paging").hide();
		}
		if (!mesage) {
			console.log(mesage);
		} else {
			alert(mesage);
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
	function page(idx) {
		var pagenum = idx;
		var contentnum = 10;
		var board = "${board}";
		if (!board) {
			location.href = "${pageContext.request.contextPath}/usedtradelist?pagenum="
					+ pagenum + "&contentnum=" + contentnum
		} else {
			location.href = "${pageContext.request.contextPath}/selectusedlist?pagenum="
					+ pagenum
					+ "&contentnum="
					+ contentnum
					+ "&mar_cate="
					+ board;
		}
	}
</script>
</head>
<body style="margin-left: 50px;">
	<jsp:include page="../header.jsp" flush="true" />
	<div>
		<div class="marleft">
			<div class="menu">
				<div class="marcategory">
					<div class="marmenu">
						<a href="tentTarp?mar_cate=텐트·타프">텐트·타프</a>
					</div>
					<div class="marmenu">
						<a href="mat?mar_cate=침낭·매트">침낭·매트</a>
					</div>
					<div class="marmenu">
						<a href="stove?mar_cate=화로·BBQ">화로·BBQ</a>
					</div>
					<div class="marmenu">
						<a href="sean?mar_cate=계절용품">계절용품</a>
					</div>
					<div class="marmenu">
						<a href="cooking?mar_cate=요리도구">요리도구</a>
					</div>
					<div class="marmenu">
						<a href="accessorie?mar_cate=액세서리">액세서리</a>
					</div>
					<div class="marmenu">
						<a href="storage?mar_cate=스토리지">스토리지</a>
					</div>
					<div class="marmenu">
						<a href="furniture?mar_cate=퍼니처">퍼니처</a>
					</div>
					<div class="marmenu">
						<a href="lighting?mar_cate=라이팅">라이팅</a>
					</div>
					<div class="marmenu">
						<a href="RV?mar_cate=RV용품">RV용품</a>
					</div>
				</div>
			</div>
		</div>
		<div class="body">
			<div class="martitle" style="text-align: center;">
				<p class="title">중고거래</p>
			</div>

			<div class="usedtradeboard">
				<c:choose>
					<c:when test="${empty uList }">
						<p style="margin-left: 450px;">-----글이 없습니다-----</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${uList }" var="dto">
							<div class="usedtradelist" style="cursor: pointer;"
								onclick="location.href='usedtradedetail?mar_num=${dto.mar_num}'">
								<div class="tradeimage">
									<img src="/resources/img/usedtrade/${dto.mar_image }"
										class="Thumbnail">
								</div>
								<div class="tradeboard">
									<div class="tradetitle">제목:${dto.mar_title}</div>
									<div class="tradewriter">작성자:${dto.member_id }</div>
									<div class="tradeprice">가격:${dto.mar_price}원</div>
									<div class="tradehit">조회수:${dto.mar_hit }</div>

								</div>
							</div>

						</c:forEach>
					</c:otherwise>
				</c:choose>

			</div>
			<div class="usedtradesearch">
				<input type="button" id="usedtradewrite" value="글 작성"
					onclick="location.href='usedtradewrite'"
					style="float: right; margin-right: 60px;">
				<form method="post" action="usedtradesearch">
					<div style="margin-left: 100px;">
						<select name="searchOption" id="searchoption">
							<option value="mar_title" id="st" name="mar_title">제목</option>
							<option value="member_id" id="sw" name="member_id">작성자</option>
							<option value="mar_content" id="sc" name="mar_content">내용</option>
						</select> <input type="text" id="searchbox" name="keyword"
							placeholder="검색어를 입력해주세요"> <input type="submit"
							value="검색" id="searchbutton">
					</div>
				</form>
			</div>

		</div>
		<div class="paging">
			<c:if test="${page.prev}">
				<a href="javascript:page(${page.getStartPage()-1});">&laquo;</a>
			</c:if>
			<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}"
				var="idx">
				<a href="javascript:page(${idx});">${idx}</a>
			</c:forEach>
			<c:if test="${page.next}">
				<a href="javascript:page(${page.getEndPage()+1});">&raquo;</a>
			</c:if>
		</div>
	</div>
	<br><br><br><br>
	<br><br><br>
	<br><br>
	<br><br>
	<br><br>
	<br><br>
	<br><br>
	<jsp:include page="../Footer2.jsp" flush="true" />
</body>
</html>