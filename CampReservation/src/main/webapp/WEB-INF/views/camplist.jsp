<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/star.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/banner.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/notice.css" type="text/css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function page(idx){
	var pagenum = idx;
	var contentnum = $("#contentnum option:selected").val();
	
	if(contentnum == 5){
	    location.href="${pageContext.request.contextPath}/camplist?pagenum="+pagenum+"&contentnum="+contentnum

	  }else if(contentnum == 10){
	    location.href="${pageContext.request.contextPath}/camplist?pagenum="+pagenum+"&contentnum="+contentnum

	  }else if(contentnum == 20){
	    location.href="${pageContext.request.contextPath}/camplist?pagenum="+pagenum+"&contentnum="+contentnum

	  }
}
</script>
	<style>
		h1{
			top-padding: 10%;
			text-align : center;
		}
		
		.camplist{
			width:100%;
			height: 100%;
		}
		
		.left{
			width:45%;
			text-align : left;
			float: left;
		}
		.right{
			width:45%;
			float: right;
		}
		.table_left{
			float : right;
		}

	</style>
</head>
<body>
	<div class="header">
		<div class="section">
			<div class="logo">
				<a href="/"><img alt="" src="/resources/img/logo/logo (2).png"
					style="height: 100px;"></a>
			</div>
			<div class="nav">
				<ul style="padding-inline-start: 0px;">
					<li class="nav-item-search">
						<form action="" style="margin-left: 0px;">
							<img class="search-icon" style="width: 64px; height: 64px;"
								src="/resources/img/search.svg"> <input class="search-form"
								type="text" placeholder="통합검색"> <span class="underline"></span>
						</form>
					</li>
					<li class="nav-item"><a href="/clist/cpl">캠핑장</a></li>
					<li class="nav-item"><a href="/clist/gl">글램핑</a></li>
					<li class="nav-item"><a href="/clist/cvl">카라반</a></li>
					<li class="nav-item"><a href="/usedtradelist">중고거래</a></li>
					<li class="nav-item"><a href="/communitylist">커뮤니티</a></li>
				</ul>
			</div>
			<div class="profile">
				<ul>
					<li><a href="/resources/login">로그인</a></li>
				</ul>
			</div>
		</div>
	</div>
	<br><br><br>
	<h1>캠핑장</h1>
	
	<div class="camplist">	
	<select name="contentnum" id="contentnum" onchange="page(1)">
      <option value="5" id="cn1" <c:if test="${page.getContentnum() == 5 }">selected="selected"</c:if> >5 개</option>
      <option value="10" id="cn2" <c:if test="${page.getContentnum() == 10 }">selected="selected"</c:if> >10 개</option>
      <option value="20" id="cn3" <c:if test="${page.getContentnum() == 20 }">selected="selected"</c:if> >20 개</option>
    </select>
		<c:forEach items="${clist}" var="dto" varStatus="status">
			<c:if test="${status.count%2 == '1'}">
				<div class="left">
					<table class="table_left">
						<tr>
							<td colspan="2">
							<c:if test="${dto.camp_img eq 'x'}">
								<a href="/campdetail"><img style="width: 540px; height: 350px;"
								src="https://pbs.twimg.com/media/Et8y5ArVcAYlA28.jpg:large"></a></c:if>
								
							<c:if test="${dto.camp_img ne 'x'}">
								<a href="/campdetail"><img style="width: 540px; height: 350px;"
								src="${dto.camp_img}"></a></c:if>
							</td>
						</tr>
						<tr>
							<td>${dto.camp_name}</td>
							<td style="text-align: center;"><img style="width: 20px; height: 20px;"
								src="/resources/Img/unlike.png"></td>
						</tr>
						<tr>
							<td>${dto.camp_addr}</td>
							<td style="text-align: center;"><button>비교</button><td>
						</tr>
						<tr><td>&nbsp;</td></tr>
					</table>
				</div>
			</c:if>
			<c:if test="${status.count%2 == '0'}">
				<div class="right">
					<table class="table_right">
						<tr>
							<td colspan="2">
							<c:if test="${dto.camp_img eq 'x'}">
								<a href="/campdetail"><img style="width: 540px; height: 350px;"
								src="https://pbs.twimg.com/media/Et8y5ArVcAYlA28.jpg:large"></a></c:if>
								
							<c:if test="${dto.camp_img ne 'x'}">
								<a href="/campdetail"><img style="width: 540px; height: 350px;"
								src="${dto.camp_img}"></a></c:if>
							</td>
						</tr>
						<tr>
							<td>${dto.camp_name}</td>
							<td style="text-align: center;"><img style="width: 20px; height: 20px;"
								src="/resources/Img/unlike.png"></td>
						</tr>
						<tr>
							<td>${dto.camp_addr}</td>
							<td style="text-align: center;"><button>비교</button><td>
						</tr>
						<tr><td>&nbsp;</td></tr>
					</table>
				</div>
			</c:if>
		</c:forEach>
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