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
<link rel="StyleSheet" href="/resources/css/banner.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/star.css" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function page(idx){
	var pagenum = idx;
	var contentnum = $("#contentnum option:selected").val();
	var searchOption = '${searchOption}';
	var keyword = '${keyword}';
	console.log(searchOption);
	if(contentnum == 5){
	    location.href="${pageContext.request.contextPath}/communitysearch?pagenum="+pagenum+"&contentnum="+contentnum+"&searchOption="+searchOption+"&keyword="+keyword
	  }else if(contentnum == 10){
	    location.href="${pageContext.request.contextPath}/communitysearch?pagenum="+pagenum+"&contentnum="+contentnum+"&searchOption="+searchOption+"&keyword="+keyword

	  }else if(contentnum == 20){
	    location.href="${pageContext.request.contextPath}/communitysearch?pagenum="+pagenum+"&contentnum="+contentnum+"&searchOption="+searchOption+"&keyword="+keyword

	  }
}
</script>
</head>
<body>
	<jsp:include page="../header.jsp" flush="true"/>


	
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
			<input type="text" id="serachbox" name="keyword" placeholder="검색어를 입력해주세요" >
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
		
		

	<jsp:include page="../Footer2.jsp" flush="true"/>
	
</body>

</html>