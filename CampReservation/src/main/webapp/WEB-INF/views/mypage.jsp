<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	background-color:black;
}
table{
	color:black;
	background-color:red;	
}

h2{	
	color: white;
	padding-right:700px;
	font-size: 25pt;
	text-align: center;
}


</style>
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
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
						<li class="nav-item"><a href="/clist/ca">캠핑모아</a></li>
						<li class="nav-item"><a href="/usedtradelist">중고모아</a></li>
						<li class="nav-item"><a href="/communitylist">커뮤모아</a></li>
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
							<a href="/clist/cpl"> 캠핑장 모아</a>
						</div>
						<div class="category">
							<a href="/clist/cvl"> 카라반 모아</a>
						</div>
						<div class="category">
							<a href="/clist/gl"> 글램핑 모아</a>
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
		<h2>마이페이지</h2>
	<div class="mypagemain">
		<div class="myinfomation">
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" id="membername" name="membername" readonly value="${dto.membername }"></td>
			</tr>
			<tr>
				<th>휴대폰번호</th>
				<td><input type="text" id="memberphone" name="memberphone" readonly value="${dto.memberphone }"></td>
			</tr>
			<tr>
				<th>선호날씨</th>
				<td><input type="button" id="Wtype" name="Wtype" value="설문조사"></td>
			</tr>
			<tr>
				<th>보유 포인트</th>
				<td><input type="text" id="pointer" name="pointer" readonly value="${dto.pointer }"></td>
			</tr>
		</table>
		</div>
		<div class="likeList">
			<table>
				<tr>
					<td rowspan="3">좋아요 리스트</td>
				</tr>
				<tr>
					<td>나나 캠핑장</td>
					<td>주소</td>
					<td>좋아요</td>
				</tr>
			</table>
		</div>
		<div class="reviewlist">
			
		</div>		
	</div>
</body>