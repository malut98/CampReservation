<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
body{
	background-color:black;
}
.signup{
	color: white;
	width: 400px;
	height: 500px;
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

#sbt{
	color: white;
	background-color: skyblue;
	margin-left: 850px;
	margin-top: 250px;
	border-radius: 15px;
}
</style>
</head>
<body>

	<div class="signup">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" placeholder="ID" style="width:300px;height:50px;"></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" placeholder="****" style="width:300px;height:50px;"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" placeholder="이름" style="width:300px;height:50px;"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="text" placeholder="성별" style="width:300px;height:50px;"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" placeholder="주소" style="width:300px;height:50px;"></td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td><input type="button" value="phone" onclick="" style="width:300px;height:50px;"></td>
			</tr>
			<tr>
				<th>날씨</th>
				<td>
				<select style="width:300px;height:50px;">
					<option value="맑음">맑음</option>
					<option value="흐림">흐림</option>
					<option value="비">비</option>
					<option value="눈">눈</option>
				</select>
				<td>
			</tr>
		</table>
		</div>
			<input type="submit" value="회원가입" id="sbt" style="width:150px; height:50px;">회원가입</button>
				
			
</body>