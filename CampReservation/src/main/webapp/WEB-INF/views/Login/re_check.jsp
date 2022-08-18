<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function reviewCheck(){ 
	    opener.parent.location.reload();
	    window.close();
	};
</script>
<body>
	<div>
	<h3>작성이 완료되었습니다.</h3>
	<input type="button" value="확인" onclick="reviewCheck();" style="width:150px; height:50px; ">
	</div>
</body>
</html>