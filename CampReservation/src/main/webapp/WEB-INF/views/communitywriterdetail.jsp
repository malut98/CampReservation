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
<link rel="StyleSheet" href="/resources/css/communitywriterdetail.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<script type="text/javascript">
function page(idx){
	var pagenum = idx;
	var contentnum = 5;
	var com_num = ${dto.com_num};
	
	    location.href="${pageContext.request.contextPath}/communitydetail?pagenum="+pagenum+"&contentnum="+contentnum+"&com_num="+com_num;

	 
}
</script>
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
	<img src="/resources/img/communityImg/${dto.com_image}">
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
	<div class="commentlist">
	<div class="commentId">
	<span class="co_id">${co.member_id}</span>
	</div>
	<div class="commentContent">
	<span class="co_content">${co.cot_content}</span>
	</div>
	<input type="button" value="삭제" id="commentdelete" onclick="location.href='commentdelete?cot_num=${co.cot_num}&com_num=${dto.com_num }'">
	<div class="commentDate">
	<span class="co_Date"><fmt:formatDate value="${co.cot_date }" pattern="yyyy.MM.dd"/></span>
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