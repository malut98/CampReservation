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
<script type="text/javascript">

function imagePreview(event){
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
					<li class="nav-item"><a href="/DB/CampDb">db</a></li>
				</ul>
			</div>
			<div class="profile">
				<ul>
					<li><a href="/login">로그인</a></li>
				</ul>
			</div>
		</div>
	</div>
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
	<input type="submit" value="저장">
	<input type="button" value="취소" onclick="location.href='communitylist'">
	</form>
	</div>
	
	
</body>
</body>
</html>