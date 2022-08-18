
<%@page import="com.camp.campreservation.Dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script>
function wtype(){
	window.open("/mypagewtype","_blank","width=700px,height=700px");
}
function rev(reser_id,camp_id,member_id){
	$.ajax({
    	type: 'post',	
    	url: 're',
    	data: {"reser_id":reser_id},
    	error: function (request, error) {
    		alert("fail");
    		console.log("code:"+request.status + "\n" + "message:"+request.responseText+ "\n" + "error:"+error);
    	},
    	success: function (result) {
    		if(result==1){
    			window.open('/write?reser_id='+reser_id+'&camp_id='+camp_id+'&member_id='+member_id, '', 'width=700, height=500, location=no, status=no, scrollbars=yes');
    		}else if(result==-1){
    			alert("여행이 아직 끝나지 않았습니다.");
    		}
    	}
    });
}
</script>
<style>
body{
	background-color:black;
}
.myinfomation{
   width:20%;
   float:left;
   margin-left:20%;
   text-align:left;
   font-weight: bold;
}
.likelist{
	width:40%;
	height:100px;
	float:right;
	margin-right:200px;
	background-color: lightgray;	
	text-align:center;
}
.camplike{
	width:40%;
	height:130px;
	float:right;
	margin-right:200px;
}
.camplike > table{
	width: 75%; 
	height:150px;
	border: 1px solid white;
	margin-left:700px;
}
.scroll{
	overflow: scroll;
}
.reviewlist{
	padding-top : 300px;
	padding-left: 300px;
}
.reviewlist>table{
	margin-left:100px;;
}
.review_list{
	border-spacing: 0 25px;
	width: 1000px;
	height: 50px;
	border-top: 1px solid #444444;
}
.review_list>th{
	border-bottom:1px solid #444444;
	padding: 10px;
}
.review_list>td{
	border-bottom:1px solid #444444;
	padding: 10px;
}
h2{	
	color: white;
	padding-right:800px;
	font-size: 25pt;
	text-align: center;
}

input{
	border: solid 1px white;
	border-radius: 10px;

}

</style>
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
</head>
<body>
<jsp:include page="../header.jsp" flush="true"/>
		
	<div class="mypagemain">
		<h2>마이페이지</h2>
		<div class="myinfomation">
		<table>
			<tr>
				<td>이름</td>
			</tr>
			<tr>
				<td><input type="text" id="memberphone" name="memberphone" readonly="readonly" value="${dto.membername }" style="width:250px;height:40px; color:black;"></td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
			</tr>
			<tr>
				<td><input type="text" id="memberphone" name="memberphone" readonly="readonly" value="${dto.memberphone }" style="width:250px;height:40px; color:black;"></td>
			</tr>
			<tr>
				<td>보유 포인트</td>
			</tr>
			<tr>	
				<td><input type="text" id="pointer" name="pointer" readonly="readonly" value="${dto.pointer }" style="width:250px;height:40px; color:black;"></td>
			</tr>
		</table>
		</div>
		<div class="like">
			<div class="likelist">
				<h3>좋아요 리스트</h3>
			</div>
			<div class="camplike" style="overflow:scroll; text-align: center;">
					<c:choose>
						<c:when test="${empty camp }">
							<tr>
								<td colspan="3">"좋아요 누른 항목이 없습니다."</td>
							</tr>
						</c:when>
						<c:otherwise>
						<c:forEach items="${camp}" var="dto" varStatus="status">
						<a href="/clist/cdetail?camp_id=${dto.camp_id}&camp_se=${dto.camp_se}&memberid=${sessionScope.memberid}">${dto.camp_name}</a><br><br>
						</c:forEach>
						</c:otherwise>
					</c:choose>
			</div>
		</div>	
		<div class="reviewlist" style="line-height:50%;">
			<table class="review_list" style="text-align: center;">			
				<tr>
					<th>예약완료</th>
					<th>한줄후기</th>
				</tr>
			<div class="review">
				<c:choose>
				<c:when test="${empty res }">
							<tr>
								<td colspan="2">"조회된 이력이 없습니다.!"</td>
							</tr>
				</c:when>
				<c:otherwise>
				<c:forEach items="${res}" var="dt" varStatus="status">
					<tr>
						<td>${dt.camp_name}</td>
						
						<td><input type="button" name="review" id="review" value="후기작성하기" style="color: black;" onclick="rev(${dt.reser_id},${dt.camp_id},'${dt.member_id}');"></td>
					</tr>
				</c:forEach>
				</c:otherwise>
				</c:choose>
			</div>
			</table>				
		</div>		
	</div>
	<jsp:include page="../Footer2.jsp" flush="true"/>
</body>
</html>