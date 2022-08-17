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
<script type="text/javascript">
$( document ).ready( function() {
	   $("#id").keyup(function(){
	      $("#checkeid").attr("value","N");//키가 감지됐을경우 다시 중복체크를 한 value값을 다시 N으로 돌려버림
	      var val = $("#checkeid").val();
	   });
	});
$( document ).ready( function() {
	   $("#memberphone").keyup(function(){
	      $("checkphone").attr("value","N");//키가 감지됐을경우 다시 중복체크를 한 value값을 다시 N으로 돌려버림
	      var val = $("checkphone").val();
	   });
	});
	function checkId(){
	   var id = $("#id").val()
	   if(id=="" || $("#id").val()==null){ //id가 ""또는 NULL일때 중복체크를 눌렀을때
	   alert("아이디를 입력해주세요");
	   $("#id").focus("checkeid");
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
	      if(confirm("회원가입이 완료되었습니다 로그인 하시겠습니까?")){
	         $("#signup").submit();
	      }
	   }
	   return false;
	};
$(document).ready(function(){
	$("#phonecheck").click(function(){
		let phonenumber = $("#memberphone").val();
		alert("인증번호 전송 완료!");		
		$.ajax({
			type:"GET",
			url:"/phonecheck",
			data:{
				"phonenumber" : phonenumber
			},
			success:function(res){
				$("#checknumber").click(function(){
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
	});
});		

</script>
<style>
body{
   background-color:black;
}
.signup{
   color: white;
   width: 550px;
   height: 400px;
   background-color:gray;
   font-size: 10pt;
   transform: translate(100%, 20%);
}

table{
   margin-left:auto;
   margin-right:auto;
   border-spacing: 10px;
}
#idcheck{
	cursor : pointer;
	background-color: skyblue;
	border-radius: 10px;
}
#phonecheck{
	cursor : pointer;
	background-color: skyblue;
	border-radius: 10px;
	border-color: skyblue;
}
#checknumber{
	cursor : pointer;
	background-color: skyblue;
	border-radius: 10px;
	border-color: skyblue;
}
#sbt{
   color: white;
   background-color: skyblue;
   margin-left: 750px;
   margin-top: 150px;
   border-radius: 15px;
   cursor : pointer;
}
</style>
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
</head>
<body>
	<jsp:include page="../header.jsp" flush="true"/>
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
         <jsp:include page="../Footer2.jsp" flush="true"/>
</body>