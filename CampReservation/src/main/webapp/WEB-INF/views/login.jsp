<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e){
	$("#login").click(function(){
		if($.trim($("#memberid").val()) == ""){
			alert("ID를 입력해주세요");
			$("#memberid").focus();
			return;
		}else if($.trim($("#memberpw").val()) == ""){
			alert("PW를 입력해주세요");
			$("#memberpw").focus();
			return;
		}
		
		$("#loginfrm").submit();
	});
	
	$("#sign").click(function(){
		location.href="/sign";
	});
});
</script>
<style>
body{
	background-color:black;
}

table{
	margin-top: auto;
	margin-left:auto;
	margin-right:auto;
	border-spacing: 10px;
	border-collapse: separate;
}

h1{	
	color: white;
	font-size: 30pt;
	text-align: center;
}

#login{
	width: 100px;
	height:40px;
	margin: auto;
	display:block;
	cursor: pointer;
	background-color: blue;
	border: solid 1px blue;
	border-radius: 10px;
}
#btnsign{
	background-color: green;
	border: solid 1px green;
	border-radius: 50px;
	width:100px;
	margin:auto;
	display:block;
	cursor: pointer;
}
</style>
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
</head>
<body>
	<div class="header">
		<div class="section">
			<div class="logo">
				<a href="/"><img alt="" src="/resources/img/logo/logo (2).png" style=" height: 100px;"></a>
			</div>
			<div class="nav">
				<ul style="padding-inline-start: 0px;">
					<li class="nav-item-search">
						<form action="" style="margin-left: 0px;">
							<img class="search-icon" style="width: 64px; height: 64px;"
								src="/resources/img/search.svg"> 
								<input class="search-form" type="text" placeholder="통합검색"> <span class="underline"></span>
						</form>
					</li>
					<li class="nav-item"><a href="/camplist">캠핑장</a></li>
					<li class="nav-item"><a href="/glamlist">글램핑</a></li>
					<li class="nav-item"><a href="/caravanlist">카라반</a></li>
					<li class="nav-item"><a href="/usedtradelist">중고거래</a></li>
					<li class="nav-item"><a href="/communitylist">커뮤니티</a></li>
				</ul>
			</div>
			<div class="profile">
				<ul>
					<li><a href="/login">로그인</a></li>
				</ul>
			</div>
		</div>
	</div>
		<h1>캠모아</h1>
		<hr />
			<c:choose>
				<c:when test="${empty sessionScope.memberid }">
					<form id="loginfrm" name="loginfrm" action="/logincheck" method="post">
						<table>
							<tr>
								<td>ID</td>
								<td><input type="text" name="memberid" id="memberid" placeholder="10글자 이내 ID입력" maxlength="10" style="color:black"></td> 
							</tr>
							<tr>
								<td>PW</td>
								<td><input type="password" name="memberpw" id="memberpw" placeholder="****" maxlength="15" style="color:black;"></td>
							</tr>
							<c:if test="${msg == '실패' }">
								<tr>
									<td colspan=2>
										아이디 또는 패스워드가 틀렸습니다.
									</td>
								</tr>
							</c:if>
							<tr>
								<td><input type="button" id="login" value="로그인"></td>
								<td><input type="button" id="sign" value="회원가입"></td>
							</tr>
						</table>
					</form>
				</c:when>
				<c:otherwise>
					<h3>${sessionScope.memberid}님 환영합니다.</h3>
					<a href="/logout">로그아웃</a>
				</c:otherwise>
			</c:choose>
			<hr />	
</body>