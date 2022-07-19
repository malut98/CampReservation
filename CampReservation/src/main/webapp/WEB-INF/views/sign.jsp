<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
function sign(){
	var id = $("#ID").val()
	$.ajax({
		url:"/idcheck",
		type:"post",
		data:{"ID":id},
		success:function(cnt){
			if(cnt != 1){
				alert("회원가입이 완료되었습니다");
			}else {
				alert("ID가 이미 존재합니다");
			}
		},
		error:function(){
			alert("잘못 입력하셨습니다");
		}
	});
};
});
</script>
<style>
body{
	background-color:black;
}
.signup{
	color: white;
	width: 400px;
	height: 450px;
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
	cursor : pointer;
}
</style>
</head>
<body>
	<form action="/login" method="post">
	<div class="signup">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" placeholder="ID" id="ID" name="memberid" style="width:300px;height:50px;"></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" placeholder="****" name="memberpw" style="width:300px;height:50px;"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" placeholder="이름" name="membername" style="width:300px;height:50px;"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>남<input type="radio" name="gender" value="M">
				여<input type="radio" name="gender" value="W">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" placeholder="주소" name="address" style="width:300px;height:50px;"></td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td><input type="text" placeholder="휴대폰 -없이" name="phone" style="width:300px;height:50px;"></td>
			</tr>
		</table>
		</div>
			<input type="submit" value="회원가입" id="sbt" onclick="sign();" style="width:150px; height:50px;">
	</form>			
			
</body>