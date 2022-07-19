<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js">
</script>
<script type="text/javascript">
/*
$(function(){
	let res=${res};
	console.log(res);
	console.log(res.response.body.numOfRows);
		for(let i=0; i<res.response.body.numOfRows; i++){
			$("tbody").append(
				"<tr>"+
				"<td><textarea name='camp_id'>"+res.response.body.items.item[i].contentId+"</textarea></td>"+
				"<td><input type='text' name='camp_name'>"+res.response.body.items.item[i].facltNm+"</td>"+
				"<td><textarea name='camp_one'>"+res.response.body.items.item[i].lineIntro+"</textarea></td>"+
				"<td><textarea name='camp_info'>"+res.response.body.items.item[i].intro+"</textarea></td>"+
				"<td><textarea name='camp_open'>"+res.response.body.items.item[i].manageSttus+"</textarea></td>"+
				"<td><textarea name='camp_char'>"+res.response.body.items.item[i].featureNm+"</textarea></td>"+
				"<td><textarea name='camp_se'>"+res.response.body.items.item[i].induty+"</textarea></td>"+
				"<td><textarea name='camp_loc'>"+res.response.body.items.item[i].lctCl+"</textarea></td>"+
				"<td><textarea name='camp_addr'>"+res.response.body.items.item[i].addr1+"</textarea></td>"+
				"<td><textarea name='camp_phone'>"+res.response.body.items.item[i].tel+"</textarea></td>"+
				"<td><textarea name='camp_web'>"+res.response.body.items.item[i].homepage+"</textarea></td>"+
				"<td><textarea name='camp_img'>"+res.response.body.items.item[i].firstImageUrl+"</textarea></td>"+
				"<td><textarea name='camp_price'>"+20000+"</textarea></td>"+
				"<td><textarea name='camp_lat'>"+res.response.body.items.item[i].mapX+"</textarea></td>"+
				"<td><textarea name='camp_long'>"+res.response.body.items.item[i].mapY+"</textarea></td>"+
				"</tr>"
			);
		}
	})
	*/
</script>
</head>
<body>
	<form action="save" method="post">
		<table border="1">
			<thead>
			</thead>
			<tbody>
			</tbody>
		</table>
	</form>
	저장
</body>
</html>