<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" href="/resources/css/communitywrite.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/banner.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/star.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Category.css"
	type="text/css">
<script type="text/javascript">
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
</head>
<body>
  <jsp:include page="../header.jsp" flush="true"/>
  
  	<div class="wrapper">
     <form action="communitywriteres" method="post" enctype="multipart/form-data">
     <input type="button" id="menu" value="목록" onclick="location.href='communitylist'">
     <select class="selectboard" name="com_cate">
     <option value="자유" class="selectedboard">자유게시판</option>
     <option value="환불" class="selectedboard">환불게시판</option>
     <option value="번개" class="selectedboard">번개게시판</option>
     <option value="불편사항" class="selectedboard">불편사항게시판</option>
     </select>
     <div class="writeform">
     <input type="text" name="com_title" id="title"><br>
     <input type="text" name="member_id" id="memid" readonly="readonly" value="${dto.member_id}" ><br>
     <input type="file" name="fileimage" id="image" accept="image/*" onchange="imagePreview(event)"><br>
     <div id="image_container"></div>
     <textarea name="com_content" id="content" rows="30" cols="100"></textarea>
     <input type="submit" id="writebutton" value="작성">
     </div>
     </form>
  	</div>
  	<br><br><br><br><br>
  	<jsp:include page="../Footer2.jsp" flush="true"/>
</body>
</html>