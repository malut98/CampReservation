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
	<link rel="StyleSheet" href="/resources/css/banner.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/star.css" type="text/css">
<link rel="stylesheet" type="text/css" href="/resources/css/usedtradewrite.css"/>
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
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
			
		};
		reader.readAsDataURL(event.target.files[0]);
	}
</script>
<body>
	<jsp:include page="../header.jsp" flush="true"/>
	
	<div class="body">
	<form action="usedtradewriteres" method="post" enctype="multipart/form-data">
	 <div class="uploadimage">
	 
	 
	 <label class="inputfilebutton" for="uploadfile">
	 사진등록
	 </label>
	 <input type="file" id="uploadfile" name="marimage" accept="image/*" onchange="imagePreview(event)" >
	 <div id= "image_container">
	 
	 </div>
	 </div>
	 <div class="usedtradewrite">
	 <div class="TradeOption">
	 <select class="ObjectOption" name="mar_cate">
	 <option value="텐트·타프" class="Object" >텐트·타프</option>
	 <option value="침낭·매트" class="Object" >침낭·매트</option>
	 <option value="화로·BBQ" class="Object" >화로·BBQ</option>
	 <option value="계절용품" class="Object" >계절용품</option>
	 <option value="요리도구" class="Object" >요리도구</option>
	 <option value="액세서리" class="Object" >액세서리</option>
	 <option value="스토리지" class="Object" >스토리지</option>
	 <option value="퍼니처" class="Object" >퍼니처</option>
	 <option value="라이팅" class="Object">라이팅</option>
	 <option value="RV용품" class="Object">RV용품</option>
	 </select>
	 </div>
	 
	 	<span class="category">제목</span> <input type="text" name="mar_title" id="ut"><br>
	 	<span class="category">작성자</span> <input type="text" name="member_id" readonly="readonly" id="member" value="<%=session.getAttribute("memberid")%>"><br>
	 	<span class="category">연락처</span> <input type="text" name="mar_name" id="un" readonly="readonly" value="${dto.memberphone }"><br>
	 	<span class="category">가격</span> <input type="number" name="mar_price" id="up"><br>
	 	<span class="category">설명</span> <textarea rows="10" cols="50" name="mar_content" id="uc"></textarea>
	 	<input type="submit" value="글쓰기" id="writebutton">
	 
	 </div>
	</form>
	</div>
	<br><br><br><br><br><br><br>
	<jsp:include page="../Footer2.jsp" flush="true"/>
</body>
</html>