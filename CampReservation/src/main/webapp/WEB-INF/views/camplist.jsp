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
		<c:forEach items="${camp}" var="dto" varStatus="status">
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
		<div class="paginate">
    	<a href="?currentPageNo=${page.firstPage}" class="prev">이전 페이지</a>
    	<span>
       		<c:forEach var="i" begin="${page.firstPage}" end="${page.lastPage}" step="1">
          	 	<c:choose>
                	<c:when test="${i eq cr.currentPageNo}"><a href="?currentPageNo=${i}">${i}</a></c:when>
                	<c:otherwise><a href="?currentPageNo=${i}">${i}</a></c:otherwise>
            	</c:choose>
        	</c:forEach>
    	</span>
    	<a href="?currentPageNo=${page.lastPage}" class="next">다음 페이지</a>
	</div>
	</div>
	
</body>
</html>