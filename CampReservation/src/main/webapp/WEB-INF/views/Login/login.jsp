<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/banner.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/notice.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Category.css"
	type="text/css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script src="/resources/js/category.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e){
	$(".login").click(function(){
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
	padding-top:15px;
}
.loginblock{
 	color: white;
   width: 450px;
   height: 300px;
   background-color:gray;
   font-size: 10pt;
   transform: translate(130%, 20%);
}


.login{
	width: 100px;
	height:40px;
	cursor: pointer;
	background-color: blue;
	border: solid 1px blue;
	border-radius: 10px;
}

#sign{
	background-color: green;
	border: solid 1px green;
	border-radius: 50px;
	width:100px;
	margin:auto;
	display:block;
	cursor: pointer;
}

.box{
	margin-top:100px;
}
</style>
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
</head>
<body>
		<jsp:include page="../header.jsp" flush="true"/>
				<div class="loginblock">
					<h1>캠모아</h1>
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
							<tr>
								<td><input type="button" class="login" value="로그인"></td>
							</tr>
							<tr>
								<td><input type="button" id="sign" value="회원가입"></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="box">
					<input type="hidden">
				</div>
			<jsp:include page="../Footer2.jsp" flush="true"/>
</body>