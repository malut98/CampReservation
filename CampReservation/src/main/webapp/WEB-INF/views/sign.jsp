<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body{
	background-color:black;
}
.signup{
	color: white;
	width: 500px;
	height: 300px;
	background-color:gray;
	font-size: 10pt;
	transform: translate(750px, 200px);
}

#sbt{
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
	<div class="signup">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" placeholder="ID"></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" placeholder="****"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" placeholder="이름"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="text" placeholder="성별"></td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td><input type="button" value="phone" onclick=""></td>
			</tr>
			<tr>
				<th>날씨</th>
				<td>
				<select>
					<option value="맑음">맑음</option>
					<option value="흐림">흐림</option>
					<option value="비">비</option>
					<option value="눈">눈</option>
				</select>
				<td>
			</tr>
		</table>
		</div>
			<button id="sbt" type="submit">회원가입</button>
</body>
</html>