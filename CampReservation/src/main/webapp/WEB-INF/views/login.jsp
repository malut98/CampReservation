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
	width: 500px;
	height: 300px;
	background-color:gray;
	font-size: 10pt;
	transform: translate(750px, 200px);
}
table{
	margin-top: auto;
	margin-left:auto;
	margin-right:auto;
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
}
#btnsign{
	background-color: green;
	border-radius: 50px 50px 50px 50px;
	width:100px;
	margin:auto;
	display:block;
	cursor: pointer;
}
</style>
<link rel="StyleSheet" href="css/Main.css" type="text/css">
</head>
<body>
	<div class="login">
		<h1>캠모아</h1>
		<div class="idpw">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" id="memberid" placeholder="Username"></td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="text" id="memberpw" placeholder="****"></td>
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