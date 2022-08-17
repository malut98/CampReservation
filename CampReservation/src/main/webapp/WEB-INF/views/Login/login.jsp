<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(e) {
		$(".login").click(function() {
			if ($.trim($("#memberid").val()) == "") {
				alert("ID를 입력해주세요");
				$("#memberid").focus();
				return;
			} else if ($.trim($("#memberpw").val()) == "") {
				alert("PW를 입력해주세요");
				$("#memberpw").focus();
				return;
			}

			$("#loginfrm").submit();
		});

		$("#sign").click(function() {
			location.href = "/sign";
		});
	});
</script>
<link rel="stylesheet" type="text/css" href="/resources/css/login_reward.css">
<link rel="stylesheet" type="text/css" href="/resources/css/util_reward.css">
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/sta1r.css" type="text/css">
</head>
<body>
	<jsp:include page="../header.jsp" flush="true" />
	<!-- <div class="loginblock">
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
				</div>-->
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="/resources/img/logo/logo (2).png" alt="IMG">
				</div>
				
				<form id="loginfrm" name="loginfrm" action="/logincheck" method="post">
					<span class="login100-form-title"> </span>

					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" id="memberid" name="memberid" placeholder="ID"> <span class="focus-input100"></span>
						<span class="symbol-input100"> <i class="fa fa-envelope"
							aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input">
						<input class="input100" type="password" name="memberpw"
							id="memberpw" placeholder="Password"> <span
							class="symbol-input100"> <i class="fa fa-lock"
							aria-hidden="true"></i>
						</span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">Login</button>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="/sign" style="color: white;"> 캠프모아는 처음이신가요?
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!--===============================================================================================-->
	<!--===============================================================================================-->
	<jsp:include page="../Footer2.jsp" flush="true" />
</body>