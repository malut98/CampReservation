<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" href="/resources/css/communitydetail.css" type="text/css">
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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
window.onload=function(){
	var mesage = "${mesage}";
	console.log(mesage);
		
	if(mesage =="작성자"){
		$("#update").show();
		$("#delete").show();
	}
	else if(mesage == "관리자"){
		$("#delete").show();
	}

	if("${writer}" == "작성자"){
		
			$(".co_id:contains('${ID}') + .commentdelete").show();
		
	}
}

function page(idx){
	var pagenum = idx;
	var contentnum = 5;
	var com_num = ${dto.com_num};
	
	    location.href="${pageContext.request.contextPath}/communitydetail?pagenum="+pagenum+"&contentnum="+contentnum+"&com_num="+com_num;

	 
}
</script>
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
						<!-- <li class="nav-item"><a href="/DB/CampImg">db</a></li> -->
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
	
	<div class="board">
	<div class="boardbutton">
	<input type="button" id="list" value="목록" onclick="location.href='communitylist'">
	<input type="button" id="update" value="수정" onclick="location.href='communityupdate?com_num=${dto.com_num}'">
	<input type="button" id="delete" value="삭제" onclick="location.href='communitydelete?com_num=${dto.com_num}&com_image=${dto.com_image}'">
	</div>
	<input type="text" id="title" name="com_title" value="${dto.com_title}" readonly="readonly">
	<input type="text" id="memberID" name="member_id" value="${dto.member_id}" readonly="readonly"><br>
	
	<div  id="content" >
	<c:if test="${!empty dto.com_image}">
	<c:forTokens var="token" items="${dto.com_image}" delims="." varStatus="status">   
	 <c:if test="${status.last}">
		<c:choose>
		<c:when test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp' }">
	<img src="/resources/img/communityImg/${dto.com_image}" id="boardimage">
			</c:when>
			</c:choose>
			</c:if>
			</c:forTokens>
	</c:if>
	<p class="ccontent">${dto.com_content}</p>
	</div>
	<div class="comment">
	<form action="commentwrite" method="get">
	<input type="hidden" name="com_num" value="${dto.com_num }">
	<input type="hidden" name="member_id" value="<%=session.getAttribute("memberid")%>">
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
	<c:forEach items="${cot}" var="cot">
	<div class="commentlist">
	<div class="commentId">
	<span class="co_id">${cot.member_id}</span>
	<input type="button" value="삭제" class="commentdelete" onclick="location.href='commentdelete?cot_num=${cot.cot_num}&com_num=${dto.com_num }'">
	</div>
	<div class="commentContent">
	<span class="co_content">${cot.cot_content}</span>
	</div>
	<div class="commentDate">
	<span class="co_Date"><fmt:formatDate value="${cot.cot_date }" pattern="yyyy.MM.dd"/></span>
	</div>	
	</div>
	
	</c:forEach>
	</c:otherwise>
	</c:choose>
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
	</div>
	</div>
</body>
</html>