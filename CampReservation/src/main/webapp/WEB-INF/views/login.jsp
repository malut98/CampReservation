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
.login{
	color: white;
	width: 450px;
	height: 350px;
	background-color:gray;
	font-size: 10pt;
	transform: translate(700px, 200px);
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
<link rel="StyleSheet" href="css/Main.css" type="text/css">
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
				</ul>
			</div>
			<div class="profile">
				<ul>
					<li><a href="/login">로그인</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="login">
		<h1>캠모아</h1>
		<div class="idpw">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" id="memberid" placeholder="Username" style="width:300px;height:50px;"></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="text" id="memberpw" placeholder="****" style="width:300px;height:50px;"></td>
			</tr>
			<tr>
				<td colspan="2"><button type="submit" id="login">로그인</button></td>
			</tr>
			<tr>
				<td colspan="2"><button id="btnsign" onclick="location.href='/sign'">회원가입</button>
			</tr>
		</table>
		</div>
	</div>
	
</body>