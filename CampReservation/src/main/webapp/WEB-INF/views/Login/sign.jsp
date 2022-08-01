<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$( document ).ready( function() {
	   $("#id").keyup(function(){
	      $("#checkeid").attr("value","N");//키가 감지됐을경우 다시 중복체크를 한 value값을 다시 N으로 돌려버림
	      var val = $("#checkeid").val();
	      console.log("checkid value ="+val);
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
	   }else if($("[name='gender']:checked").length ==0){
	      alert("성별을 체크해주세요");
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
	}

</script>
<style>
body{
   background-color:black;
}
.signup{
   color: white;
   width: 500px;
   height: 450px;
   background-color:gray;
   font-size: 10pt;
   transform: translate(600px, 100px);
}

table{
   margin-left:auto;
   margin-right:auto;
   border-spacing: 10px;
   border-collapse: separate;
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
	 <form id="signup" name="signup" action="/signup" method="post">
   <div class="signup">
      <table><input type="text" value="N" id="checkeid" hidden style="display: none;">
         <tr>
            <th>ID</th>
            <td><input type="text" placeholder="ID" id="id" name="memberid" style="width:300px;height:50px; color:black;"></td>
            <td><input type="button" value="중복확인" onclick="checkId();"></td>
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
         </tr>
         <tr>
            <th>성별</th>
            <td>남<input type="radio" name="gender" value="M">
            여<input type="radio" name="gender" value="W">
            </td>
         </tr>
         <tr>
            <th>주소</th>
            <td><input type="text" placeholder="주소" id="adress" name="adress" style="width:300px;height:50px; color:black;"></td>
         </tr>
      </table>
      </div>
      </form>
         <input type="button" value="회원가입" id="sbt" onclick="sign(); return false;" style="width:150px; height:50px; ">
</body>