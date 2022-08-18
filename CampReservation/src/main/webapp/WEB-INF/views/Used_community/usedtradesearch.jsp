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
	$(function() {
		
		if('${ulist}'=='[]'){
			$(".paging").hide();
		}
	});
	function page(idx){
		var pagenum = idx;
		var contentnum = 10;
		var searchOption = '${searchOption}';
		var keyword = '${keyword}';
		location.href="${pageContext.request.contextPath}/usedtradesearch?pagenum="+pagenum+"&contentnum="+contentnum+"&searchOption="+searchOption+"&keyword="+keyword
	}
	
</script>
</head>
<body>
	<jsp:include page="../header.jsp" flush="true"/>


	<div class="body">
		<p class="title">중고거래</p>
		<div class="usedtradeboard">
			<c:choose>
				<c:when test="${empty ulist }">
					<p>------글이 없습니다-----</p>
				</c:when>
				<c:otherwise>
					<c:forEach items="${ulist }" var="dto">
						<div class="usedtradelist" style="cursor: pointer;"
							onclick="location.href='usedtradedetail?mar_num=${dto.mar_num}'">
							<div class="tradeimage">
								<img src="/resources/img/usedtrade/${dto.mar_image }">
							</div>
							<div class="tradeboard">
								<div class="tradetitle">${dto.mar_title}</div>
								<div class="tradewriter">${dto.member_id }</div>
								<div class="tradeprice">${dto.mar_price}</div>
								<div class="tradehit">${dto.mar_hit }</div>

							</div>
						</div>

					</c:forEach>
				</c:otherwise>
			</c:choose>

		</div>
		<div class="usedtradesearch">
		<input type="button" id="usedtradewrite" value="글 작성" onclick="location.href='usedtradewrite'">
			<form method="post" action="usedtradesearch">
			<select name="searchOption" id="searchoption">
			<option value="mar_title" id="st" name="mar_title">제목</option>
			<option value="member_id" id="sw" name="member_id" >작성자</option>
			<option value="mar_content" id="sc" name="mar_content" >내용</option>
			</select>
			<input type="text" id="searchbox" name="keyword" placeholder="검색어를 입력해주세요">
			<input type="submit" value="검색" id="searchbutton">
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
	<br><br><br><br><br><br><br><br>
	<jsp:include page="../Footer2.jsp" flush="true"/>
</body>
</html>