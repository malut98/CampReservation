<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout" >
<head>
<meta charset="UTF-8">
<title>community</title>
<link rel="StyleSheet" href="/resources/css/community.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/star.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/banner.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/notice.css" type="text/css">
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
window.onload=function(){
	var mesage = "${mesage}";
	if(!mesage){
		console.log(mesage);
	}else{
		alert(mesage);
	}
	
	}


function page(idx){
	var pagenum = idx;
	var contentnum = $("#contentnum option:selected").val();
	
	if(contentnum == 5){
	    location.href="${pageContext.request.contextPath}/communitylist?pagenum="+pagenum+"&contentnum="+contentnum

	  }else if(contentnum == 10){
	    location.href="${pageContext.request.contextPath}/communitylist?pagenum="+pagenum+"&contentnum="+contentnum

	  }else if(contentnum == 20){
	    location.href="${pageContext.request.contextPath}/communitylist?pagenum="+pagenum+"&contentnum="+contentnum

	  }
	
}

</script>

</head>
<body>
	

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
						<li class="nav-item"><a href="/clist/ca?${sessionScope.memberid}">캠핑모아</a></li>
						<li class="nav-item"><a href="/usedtradelist">중고모아</a></li>
						<li class="nav-item"><a href="/communitylist">커뮤모아</a></li>
						<li class="nav-item"><a href="/DB/CampImg">db</a></li>
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
							<a href="/clist/cpl?${sessionScope.memberid}"> 캠핑장 모아</a>
						</div>
						<div class="category">
							<a href="/clist/cvl?${sessionScope.memberid}"> 카라반 모아</a>
						</div>
						<div class="category">
							<a href="/clist/gl?${sessionScope.memberid}"> 글램핑 모아</a>
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
	<br><br><br><br>
	<div class = "communityboard">
	<select name="contentnum" id="contentnum" onchange="page(1)">
      <option value="5" id="cn1" <c:if test="${page.getContentnum() == 5 }">selected="selected"</c:if> >5 개</option>
      <option value="10" id="cn2" <c:if test="${page.getContentnum() == 10 }">selected="selected"</c:if> >10 개</option>
      <option value="20" id="cn3" <c:if test="${page.getContentnum() == 20 }">selected="selected"</c:if> >20 개</option>
    </select>
	
		<table border = "1" class="board">
		<tr>
		<th >글번호</th>
		<th>제목</th>
		<th >작성자</th>
		<th >작성일</th>
		<th >조회</th>
		</tr>
		<c:choose>
		<c:when test="${empty clist }">
		<tr>
			<td colspan="4" align="center">--------작성된 글이 없습니다---------</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach items="${clist }" var="dto">
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
			<form method="post" action="communitysearch">
			<select name="searchOption" id="searchoption">
			<option value="com_title" id="st" name="com_title">제목</option>
			<option value="member_id" id="sw" name="member_id" >작성자</option>
			<option value="com_content" id="sc" name="com_content" >내용</option>
			</select>
			<input type="text" id="serachbox" name="keyword" placeholder="검색어를 입력해주세요">
			<input type="submit" value="검색" id="searchbutton">
			</form>
			<br><br>
			<div class="paging">
			<c:if test="${page.prev}">
                    <a href="javascript:page(${page.getStartPage()-1});">&laquo;</a>
                  </c:if>
                  <c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
                    <a href="javascript:page(${idx});">${idx}</a>
                  </c:forEach>
                  <c:if test="${page.next}">
                    <a href="javascript:page(${page.getEndPage()+1});">&raquo;</a>
                  </c:if>
			
			</div>
			
		</div>
		
		

	
	
</body>

</html>