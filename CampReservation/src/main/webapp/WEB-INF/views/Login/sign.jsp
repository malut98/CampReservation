<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
<link rel="stylesheet" type="text/css" href="/resources/css/login_reward.css">
<link rel="stylesheet" type="text/css" href="/resources/css/util_reward.css">
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<script type="text/javascript">
$( document ).ready( function() {
		$("#id").keyup(function(){
	      	$("#checkeid").attr("value","N");//키가 감지됐을경우 다시 중복체크를 한 value값을 다시 N으로 돌려버림
	      	var val = $("#checkeid").val();
	   });
	   $("#memberphone").keyup(function(){
	      $("checkphone").attr("value","N");//키가 감지됐을경우 다시 중복체크를 한 value값을 다시 N으로 돌려버림
	      var val = $("checkphone").val();
	   });
	   $('#id').change(function () {
		   checkId();
		});
	   /*
		$("#memberphone").change(function(){
			let phonenumber = $("#memberphone").val();
			alert("인증번호 전송 완료!");		
			$.ajax({
				type:"GET",
				url:"/phonecheck",
				data:{
					"phonenumber" : phonenumber
				},
				success:function(res){
					$("#checknumber").change(function(){
						if($.trim(res) == $("#phonenumber").val()){
							alert("휴대폰 인증이 정상적으로 완료되었습니다.!"),						
							$.ajax({
								type:"get",
								url:"/phone",
								data:{
									"phonenumber" : $("#memberphone").val()
								}
							})
						}else{
							alert("인증번호가 올바르지 않습니다!");
						}
					})
				}
			})
		});*/
});
	function checkId(){
	   var id = $("#id").val()
	   if(id=="" || $("#id").val()==null){ //id가 ""또는 NULL일때 중복체크를 눌렀을때
	   alert("아이디를 입력해주세요");
	   $("#id").focus();
	   }else{
	   $.ajax({
	      url:"/idcheck",
	      type:"post",
	      data:{"id":id},
	      success:function(cnt){
	         if(cnt == 0){
	            console.log("가능");
	            alert("사용가능한 아이디입니다.");
	         $("#checkeid").attr("value","Y");
	         }else {
	            console.log("불가능");
	            $("#id").val("");
	            $("#id").focus();
	            alert("사용 중인 아이디입니다. 다시 입력해주세요");
	         $("#checkeid").attr("value","N");
	         }
	      },
	      error:function(){
	         alert("잘못 입력하셨습니다");
	      },
	   });
	   }
	};
	function sign(){ //예외처리
	   if($("#id").val()==""||$("#id").val()==null){
	     $("#id").focus(); // 입력폼으로 돌려내기
	      alert("아이디를 입력해주세요");
	      return;
	   }else if($("#password").val()==""||$("#password").val()==null){
	      alert("비밀번호를 입력해주세요");
	     $("#password").focus();
	      return;
	   }else if($("#membername").val()==""||$("#membername").val()==null){
	      alert("이름을 입력해주세요");
	     $("#membername").focus();
	      return;
	   }else if($("#memberphone").val()==""||$("#memberphone").val()==null){
	      alert("휴대폰 번호를 입력해주세요");
	     $("#memberphone").focus();
	      return;
	   }else if($("#checkeid").val() != "Y"){
	   alert("아이디 중복 체크를 해주세요");
	   return;
	   }else{
	      	$("#signup").submit();
	      }
	   return false;
	   }
	function SetNum(obj){
		   val=obj.value;
		   re=/[^0-9]/gi;
		   obj.value=val.replace(re,""); 
	}
</script>
<style>
.login100-pic {
    width: 316px;
    align-items: center;
    display: flex;
    justify-content: center;
}
</style>
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
</head>
<body>
	<jsp:include page="../header.jsp" flush="true"/>
	<!-- 
	 <form id="signup" name="signup" action="/signup" method="post">
   <div class="signup">
      <table><input type="text" value="N" id="checkeid" hidden style="display: none;">
      		<input type="text" value="N" id="checkphone" hidden style="display: none;">	
         <tr>
            <th>ID</th>
            <td><input type="text" placeholder="ID" id="id" name="memberid" style="width:300px;height:50px; color:black;"></td>
            <td><input type="button" id="idcheck" value="중복확인" onclick="checkId();"></td>
         </tr>
         <tr>
            <th>PW</th>
            <td><input type="password" placeholder="****" id="password" name="memberpw" style="width:300px;height:50px; color:black;"></td>
         </tr>
         <tr>
            <th>이름</th>
            <td><input type="text" placeholder="이름" id="membername" name="membername" style="width:300px;height:50px; color:black;"></td>
         </tr>
         <tr>
            <th>휴대폰</th>
            <td><input type="text" placeholder="휴대폰 -없이" id="memberphone" name="memberphone" style="width:300px;height:50px; color:black;"></td>
        	<td><input type="button" id="phonecheck" value="인증번호전송"></td>
         </tr>
         <tr>
         	<th>인증번호</th>
         	<td><input type="text" placeholder="휴대폰 -없이" id="phonenumber" name="phonenumber" style="width:300px;height:50px; color:black;"></td>
         	<td><input type="button" id="checknumber" value="인증번호확인"></td>
         </tr>
      </table>
      </div>
      </form>
         <input type="button" value="회원가입" id="sbt" onclick="sign(); return false;" style="width:150px; height:50px; ">
         
         -->
         	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="/resources/img/logo/logo (2).png" alt="IMG">
				</div>
				<input type="text" value="N" id="checkeid" hidden style="display: none;">
      			<input type="text" value="N" id="checkphone" hidden style="display: none;">	
				<form class="login100-form validate-form" id="signup" name="signup" action="/signup" method="post" autocomplete="off">
					<span class="login100-form-title">
					</span>
					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" id="id" name="memberid" placeholder="ID">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input">
						<input class="input100" type="password" id="password" name="memberpw" placeholder="Password">
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" id="membername" name="membername" placeholder="이름">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" id="memberphone" name="memberphone" placeholder="휴대번호" 
						onKeyPress="SetNum(this);" onKeyUp="SetNum(this);" maxlength='11'>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" onclick="sign(); return false;">
							Sign Up
						</button>
					</div>

					<div class="text-center p-t-136">
					</div>
				</form>
			</div>
		</div>
	</div>
         <jsp:include page="../Footer2.jsp" flush="true"/>
</body>