<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.cwtype{
color:black;
margin: auto;
}
.check{
border: 1px solid black;
width: 15%;

}
</style>
</head>
<body>
	<div class="wrap">
	<div class="container">
	<div class="titletext">
	<p>선호 날씨 선택(중복선택 가능)</p>
	</div>
	<div class="check">
	<form action="selectwtype" method="get">
	<label><input type="checkbox" name="wtype" class="cwtype" value="비">비</label>&nbsp;&nbsp;&nbsp;
	<label><input type="checkbox" name="wtype" class="cwtype" value="맑음">맑음</label><br>
	<label><input type="checkbox" name="wtype" class="cwtype" value="눈">눈</label>&nbsp;&nbsp;&nbsp;
	<label><input type="checkbox" name="wtype" class="cwtype" value="흐림">흐림</label>
	<br><br><input type="submit" value="확인">
	</form>
	</div>
	</div>
	</div>
</body>
</html>