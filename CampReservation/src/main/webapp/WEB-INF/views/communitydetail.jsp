<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" href="/resources/css/communitydetail.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
</head>

<body>
<div class="header">
		<div class="section">
			<div class="logo">
				<a href="/"><img alt="" src="img/logo/logo (2).png" style=" height: 100px;"></a>
			</div>
			<div class="nav">
				<ul style="padding-inline-start: 0px;">
					<li class="nav-item-search">
						<form action="" style="margin-left: 0px;">
							<img class="search-icon" style="width: 64px; height: 64px;"
								src="img/search.svg"> 
								<input class="search-form" type="text" placeholder="통합검색"> <span class="underline"></span>
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
	
	<div class="board">
	<input type="button" id="list" value="목록" onclick="location.href='communitylist'">
	<input type="text" id="title" name="com_title" value="${dto.com_title}" readonly="readonly">
	<input type="text" id="memberID" name="member_id" value="${dto.member_id}" readonly="readonly"><br>
	<textarea name="com_content" id="content" rows="30" cols="100" readonly="readonly" >${dto.com_content}</textarea>
	<div class="comment">
	<form action="commentwrite" method="get">
	<input type="hidden" name="com_num" value="${dto.com_num }">
	<input type="text" id="commentContent" name="cot_content">
	<input type="submit" id="commentwrite" value="작성">
	</form>
	<div class="commentListbox">
	
	<c:choose>
	<c:when test="${empty cot }">
	<div class="nullcot">
	<span id="nullcomment">----댓글이 없습니다----</span>
	</div>
	</c:when>
	<c:otherwise>
	<c:forEach items="${cot}" var="co">
	<div class="commentId">
	<span class="co_id">${co.member_id}</span>
	</div>
	<div class="commentContent">
	<span class="co_content">${co.cot_content}</span>
	</div>
	<div class="commentDate">
	<span class="co_Date"><fmt:formatDate value="${co.cot_date }" pattern="yyyy.MM.dd"/></span>
	</div>
	</c:forEach>
	</c:otherwise>
	</c:choose>
	
	</div>
	</div>
	</div>
</body>
</html>