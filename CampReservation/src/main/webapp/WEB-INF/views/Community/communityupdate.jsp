<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" href="/resources/css/communityupdate.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="StyleSheet" href="/resources/css/banner.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/star.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/notice.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Category.css"
	type="text/css">
	
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
$(function(){
	var com_image = "${dto.com_image}";
	if(!com_image){
		$("#comimage").hide();
	}
});
function imagePreview(event){
	$("#comimage").show();
	var reader = new FileReader();
	reader.onload = function(event){
	$img = document.querySelector("div#image_container>img");
	$img.src =event.target.result;	
	};
	reader.readAsDataURL(event.target.files[0]);
}
</script>
</head>
<body>
<jsp:include page="../header.jsp" flush="true"/>

	<div class="wrapper">
	<form action="communityupdateres" method="post" enctype="multipart/form-data">
	<div class="board">
	<input type="hidden" name="com_num" value="${dto.com_num}">
	<input type="hidden" name="com_image" value="${dto.com_image }">
	<input type="button" id="list" value="목록" onclick="location.href='communitylist'">
	<input type="text" id="title" name="com_title" value="${dto.com_title}" >
	<input type="text" id="memberID" name="member_id" value="${dto.member_id}" readonly="readonly"><br>
	<input type="file" name="fileimage" id="image" accept="image/*" onchange="imagePreview(event)">
	<label for="image" id="imagebutton">사진등록</label>
	<div id="image_container">
	<img src="/resources/Img/communityimg/${dto.com_image}" id="comimage"><br>
	</div>
	<textarea id="content" name="com_content" cols="40" rows="60" >${dto.com_content}</textarea>
	</div>
	<input type="submit" value="저장" class="save">
	<input type="button" value="취소" onclick="location.href='communitylist'" class="cancel">
	</form>
	</div>
	<br><br><br><br><br>
	<jsp:include page="../Footer2.jsp" flush="true"/>
</body>
</body>
</html>