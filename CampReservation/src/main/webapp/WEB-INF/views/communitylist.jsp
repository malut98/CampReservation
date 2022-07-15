<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout" >
<head>
<meta charset="UTF-8">
<title>community</title>
<link rel="StyleSheet" href="css/community.css" type="text/css">
<link rel="StyleSheet" href="css/Main.css" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
	<br><br><br><br>
	<div class = "communityboard">
		<table border = "1" class="board">
		<tr>
		<th >글번호</th>
		<th>제목</th>
		<th >작성자</th>
		<th >작성일</th>
		<th >조회</th>
		</tr>
		<c:choose>
		<c:when test="${empty boardList }">
		<tr>
			<td colspan="4" align="center">--------작성된 글이 없습니다---------</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach items="${boardList }" var="dto">
			<tr>
			<td>${dto.com_num}</td>
			<td><a href="communitydetail?com_num=${dto.com_num}">${dto.com_title}</a></td>
			<td>${dto.member_id}</td>
			<td><fmt:formatDate value="${dto.com_date}" pattern="yyyy.MM.dd"/></td>
			<td>${dto.com_hit}</td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
			<input type="button" id="boardwrite" value="글 작성" onclick="location.href='communitywrite'">
			<input type="text" id="serachbox">
		</div>
		
		<th:block layout:fragment="paging">
				<nav th:replace="community/common :: pagination"></nav>
			</th:block>

	<th:block layout:fragment="script">
		<script th:inline="javascript">
			/*<![CDATA[*/

			function movePage(uri, queryString) {
				location.href = uri + queryString;
			}

			/*]]>*/
		</script>
	</th:block>
	
</body>

</html>