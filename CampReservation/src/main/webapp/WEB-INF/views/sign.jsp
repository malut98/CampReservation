<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body{
	background-color:black;
}
.signup{
	color: white;
	width: 500px;
	height: 300px;
	background-color:gray;
	font-size: 10pt;
	transform: translate(750px, 200px);
}

#sbt{
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
	<div class="signup">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" placeholder="ID"></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" placeholder="****"></td>
			</tr>
			<tr>
				<th>�̸�</th>
				<td><input type="text" placeholder="�̸�"></td>
			</tr>
			<tr>
				<th>����</th>
				<td><input type="text" placeholder="����"></td>
			</tr>
			<tr>
				<th>�޴���</th>
				<td><input type="button" value="phone" onclick=""></td>
			</tr>
			<tr>
				<th>����</th>
				<td>
				<select>
					<option value="����">����</option>
					<option value="�帲">�帲</option>
					<option value="��">��</option>
					<option value="��">��</option>
				</select>
				<td>
			</tr>
		</table>
		</div>
			<button id="sbt" type="submit">ȸ������</button>
</body>
</html>