<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/notice.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Category.css"
	type="text/css">
<link rel="stylesheet" type="text/css" href="/resources/css/usedtradeupdate.css"/>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/star.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script src="/resources/js/category.js"></script>
<script>
	$(function() {
		$('.item-wrapper').slick({
			dots : false,
			infinite : true,
			speed : 300,
			slidesToShow : 4,
			slidesToScroll : 2,
			responsive : [ {
				breakpoint : 1024,
				settings : {
					slidesToShow : 3,
					slidesToScroll : 3
				}
			}
			// You can unslick at a given breakpoint now by adding:
			// settings: "unslick"
			// instead of a settings object
			]
		});
	});
	function imagePreview(event){
		var reader = new FileReader();
		reader.onload = function(event){
		$img = document.querySelector("div#image_container>img");
		$img.src =event.target.result;	
		};
		reader.readAsDataURL(event.target.files[0]);
	}
</script>
<body>
<jsp:include page="../header.jsp" flush="true"/>
	<div class="body">
	 <input type="button" value="&lt;" id="menubutton" onclick="location.href='usedtradelist'">
	 <label for="menubutton" id="mb">&lt;</label>
	 <form method="post" action="usedtradeupdateres" enctype="multipart/form-data">
	 <div class="usedtradeboard">
	 <div class="boardimage">
	 <div id="image_container">
	 <img src="/resources/Img/usedtrade/${dto.mar_image }" class="boardimage">
	 </div>
	 <label class="inputfilebutton" for="uploadfile">
	 사진등록
	 </label>
	 <input type="file" id="uploadfile" name="marimage" accept="image/*" onchange="imagePreview(event)" >
	 <input type="hidden" name="mar_image" value="${dto.mar_image}">
	 <input type="hidden" name="mar_num" value="${dto.mar_num}">
	 </div>
	 	<span class="detailcategory">제목</span> <input type="text" name="mar_title" id="ut"  value="${dto.mar_title }"><br>
	 	<span class="detailcategory">작성자</span> <input type="text" name="member_id" readonly="readonly" id="member" value="${dto.member_id }"><br>
	 	<span class="detailcategory">연락처</span> <input type="text" name="mar_name" id="un" readonly="readonly" value="${dto.mar_name }"><br>
	 	<span class="detailcategory">가격</span> <input type="number" name="mar_price" id="up"  value="${dto.mar_price }"><br>
	 	<span class="detailcategory">설명</span> <textarea rows="10" cols="50" name="mar_content" id="uc"  >${dto.mar_content }</textarea>
	 
	 </div>
	 <div class="boardbutton">
		<input type="submit" value="확인" id="boardok">
	 </div>
	 </form>
	</div>
	<br><br><br><br><br><br>
	<jsp:include page="../Footer2.jsp" flush="true"/>
</body>
</html>