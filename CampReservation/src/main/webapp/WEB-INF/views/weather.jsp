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
		<h3>���� ������ ķ���Ͻô� ���� �����Ͻʴϱ� ?</h3>
		<input type="radio" name="clear" value="clearyes">��
		<input type="radio" name="clear" value="clearno">�ƴϿ�
		<h3>�帰 ������ ķ���Ͻô� ���� �����Ͻʴϱ� ?</h3>
		<input type="radio" name="overcast" value="overcastyes">��
		<input type="radio" name="overcast" value="overcastno">�ƴϿ�
		<h3>����� ������ ķ���Ͻô� ���� �����Ͻʴϱ� ? </h3>
		<input type="radio" name="rain" value="rainyes">��
		<input type="radio" name="rain" value="rainno">�ƴϿ�
		<h3>������ ������ ķ���Ͻô� ���� �����Ͻʴϱ� ? </h3>
		<input type="radio" name="snow" value="snowyes">��
		<input type="radio" name="snow" value="snowno">�ƴϿ�
		<h3>��û ������ ķ���Ͻô� ���� �����Ͻʴϱ� ?</h3>
		<input type="radio" name="sunny" value="sunnyyes">��
		<input type="radio" name="sunny" value="sunnyno">�ƴϿ�
		<br>
		<br>
		<button type="submit" onclick="Rating();">���� Ȯ��</button>
		<div id="rating"></div>
	</div>
</body>
</html>