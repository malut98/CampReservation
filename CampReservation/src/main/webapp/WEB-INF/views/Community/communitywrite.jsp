<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" href="/resources/css/communitywrite.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
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
     <div class="header">
		<div class="section">
			<div class="logo">
				<a href="/"><img alt="" src="img/logo/logo (2).png" style=" height: 100px;"></a>
			</div>
			<div class="nav">
				<ul style="padding-inline-start: 0px;">
					<li class="nav-item-search">
						<form action="" style="margin-left: 0px;">
							<img class="search-icon" style="width: 64px; height: 64px;"
								src="img/search.svg"> 
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
     <form action="communitywriteres" method="post" enctype="multipart/form-data">
     <input type="button" id="menu" value="목록" onclick="location.href='communitylist'">
     <div class="writeform">
     <input type="text" name="com_title" id="title"><br>
     <input type="text" name="member_id" id="memid" readonly="readonly" value="${dto.member_id}" ><br>
     <input type="file" name="fileimage" id="image" accept="image/*" onchange="imagePreview(event)"><br>
     <div id="image_container"></div>
     <textarea name="com_content" id="content" rows="30" cols="100"></textarea>
     <input type="submit" id="writebutton" value="작성">
     </div>
     </form>
</body>
</html>