<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

</script>
<style>
body{
	background-color:black;
}
.login{
	color: black;
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
	<div class="login">
		<h1>캠모아</h1>
		<div class="idpw">
		<form action="/login/index" method="post">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" id="id" placeholder="Username" style="width:300px;height:50px; color:black;" ></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="text" id="password" placeholder="****" style="width:300px;height:50px; color:black;"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" id="login" value="로그인"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" id="btnsign" value="회원가입" onclick="location.href='/sign'"></td>
			</tr>
		</table>
		</form>
		</div>
	</div>
	
</body>