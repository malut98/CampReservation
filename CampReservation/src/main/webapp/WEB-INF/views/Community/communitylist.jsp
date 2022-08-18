<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org"
	xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">
<head>
<meta charset="UTF-8">
<title>community</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<link rel="StyleSheet" href="/resources/css/community.css"
	type="text/css">
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/notice.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/banner.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/star.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Category.css"
	type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script src="/resources/js/category.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
window.onload=function(){
	var mesage = "${mesage}";
	var member = '<%=(String) session.getAttribute("memberid")%>';
		var board = '${board}';
	var clist = "${clist}";
	if(clist == "[]"){
		$(".pagination").hide();
	}
	
	
		if (!mesage) {
			console.log(mesage);
		} else {
			alert(mesage);
		}
		if (member == "admin") {
			$(".adminwrite").show();
		}
		if (board == "공지") {
			$(".comtitle").text("공지사항");
		} else if (board == "이벤트") {
			$(".comtitle").text("이벤트");
		} else if (board == "환불") {
			$(".comtitle").text("환불 게시판");
		} else if (board == "자유") {
			$(".comtitle").text("자유 게시판");
		} else if (board == "불편사항") {
			$(".comtitle").text("불편사항");
		} else if (board == "번개") {
			$(".comtitle").text("번개 게시판");
		}

	}

	function page(idx) {
		var pagenum = idx;
		var contentnum = $("#contentnum option:selected").val();
		var board = '${board}';
		if(!board){
			if (contentnum == 5) {
				location.href = "${pageContext.request.contextPath}/communitylist?pagenum="
						+ pagenum + "&contentnum=" + contentnum

			} else if (contentnum == 10) {
				location.href = "${pageContext.request.contextPath}/communitylist?pagenum="
						+ pagenum + "&contentnum=" + contentnum

			} else if (contentnum == 20) {
				location.href = "${pageContext.request.contextPath}/communitylist?pagenum="
						+ pagenum + "&contentnum=" + contentnum

			}

		}else{
		if (contentnum == 5) {
			location.href = "${pageContext.request.contextPath}/communityselectlist?pagenum="
					+ pagenum + "&contentnum=" + contentnum + "&com_cate="+board

		} else if (contentnum == 10) {
			location.href = "${pageContext.request.contextPath}/communityselectlist?pagenum="
					+ pagenum + "&contentnum=" + contentnum + "&com_cate="+board

		} else if (contentnum == 20) {
			location.href = "${pageContext.request.contextPath}/communityselectlist?pagenum="
					+ pagenum + "&contentnum=" + contentnum + "&com_cate="+board

		}
		}
	}
</script>
</head>
<body>
</head>
<body>
<jsp:include page="../header.jsp" flush="true"/>
		
	<br>
	<br>
	<br>
	<br>
		<div class="communityleft">
			<div class="communitymenu">
				<div class="communitycategory">
					<a href="noticelist?com_cate=공지">공지사항</a>
				</div>
				<div class="communitycategory">
					<a href="eventlist?com_cate=이벤트">이벤트</a>
				</div>
				<div class="communitycategory">
					<a href="freelist?com_cate=자유">자유게시판</a>
				</div>
				<div class="communitycategory">
					<a href="refund?com_cate=환불">환불게시판</a>
				</div>
				<div class="communitycategory">
					<a href="inconvenient?com_cate=불편사항">불편사항게시판</a>
				</div>
				<div class="communitycategory">
					<a href="blinddate?com_cate=번개">번개게시판</a>
				</div>
			</div>

		</div>
	<div class="communityboard">
	<div class="selectcontentnum">
		<select name="contentnum" id="contentnum" onchange="page(1)">
			<option value="5" id="cn1"
				<c:if test="${page.getContentnum() == 5 }">selected="selected"</c:if>>5
				개</option>
			<option value="10" id="cn2"
				<c:if test="${page.getContentnum() == 10 }">selected="selected"</c:if>>10
				개</option>
			<option value="20" id="cn3"
				<c:if test="${page.getContentnum() == 20 }">selected="selected"</c:if>>20
				개</option>
		</select>
		</div>
		<div class="communitytop">
			<span class="comtitle">전체 게시판</span>
		</div>
		<div class="communitycenter">
			<div class="communitycontent">
			<table border="1" class="table   text-center">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회</th>
				</tr>
				<c:choose>
					<c:when test="${empty clist }">
						<tr>
							<td colspan="4" align="center">--------작성된 글이 없습니다-------</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${clist }" var="dto">
							<tr>
								<td>${dto.com_num}</td>
								<td><a href="communitydetail?com_num=${dto.com_num}&com_cate=${dto.com_cate}">${dto.com_title}</a></td>
								<td>${dto.member_id}</td>
								<td><fmt:formatDate value="${dto.com_date}"
										pattern="yyyy.MM.dd" /></td>
								<td>${dto.com_hit}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			</div>
			<div class="boardadd">
			<input type="button" id="boardwrite" value="글 작성"
				onclick="location.href='communitywrite'"> <input
				type="button" class="adminwrite" value="공지 아벤트 작성"
				onclick="location.href='adminwrite'">
				</div>
				<div class="boardsearch">
			<form method="post" action="communitysearch">
				<input type="hidden" name="board" value="${board}">
				<select name="searchOption" id="searchoption">
					<option value="com_title" id="st" name="com_title">제목</option>
					<option value="member_id" id="sw" name="member_id">작성자</option>
					<option value="com_content" id="sc" name="com_content">내용</option>
				</select> <input type="text" id="serachbox" name="keyword"
					placeholder="검색어를 입력해주세요"> <input type="submit" value="검색"
					id="searchbutton">
			</form>
			</div>
		</div>
		<br> <br>
		<div class="pagination justify-content-center">
			<c:if test="${page.prev}">
				<a href="javascript:page(${page.getStartPage()-1});">&laquo;</a>
			</c:if>
			<div class="pagenumber">
			<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}"
				var="idx">
				<a href="javascript:page(${idx});">${idx}</a>
			</c:forEach>
			</div>
			<c:if test="${page.next}">
				<a href="javascript:page(${page.getEndPage()+1});">&raquo;</a>
			</c:if>

		</div>

	</div>

<br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="../Footer2.jsp" flush="true"/>


</body>

</html>