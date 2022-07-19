<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<div>
		<h3>맑은 날씨에 캠핑하시는 것을 좋아하십니까 ?</h3>
		<input type="radio" name="clear" value="clearyes">네
		<input type="radio" name="clear" value="clearno">아니요
		<h3>흐린 날씨에 캠핑하시는 것을 좋아하십니까 ?</h3>
		<input type="radio" name="overcast" value="overcastyes">네
		<input type="radio" name="overcast" value="overcastno">아니요
		<h3>비오는 날씨에 캠핑하시는 것을 좋아하십니까 ? </h3>
		<input type="radio" name="rain" value="rainyes">네
		<input type="radio" name="rain" value="rainno">아니요
		<h3>눈오는 날씨에 캠핑하시는 것을 좋아하십니까 ? </h3>
		<input type="radio" name="snow" value="snowyes">네
		<input type="radio" name="snow" value="snowno">아니요
		<h3>쾌청 날씨에 캠핑하시는 것을 좋아하십니까 ?</h3>
		<input type="radio" name="sunny" value="sunnyyes">네
		<input type="radio" name="sunny" value="sunnyno">아니요
		<br>
		<br>
		<button type="submit" onclick="Rating();">지수 확인</button>
		<div id="rating"></div>
	</div>
</body>
</html>