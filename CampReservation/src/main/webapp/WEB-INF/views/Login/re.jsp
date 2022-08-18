<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function reviewCheck(){ 
	   if($(".content").val()==""||$(".content").val()==null){
	     $(".content").focus(); // 입력폼으로 돌려내기
	      alert("리뷰를 입력해주세요.");
	      return;
	   }else{
	      if(confirm("리뷰를 등록하시겠습니까?")){
	         $(".rev").submit();
	      }
	   }
	};
	function reviewUpdate(){ 
		   if($(".content").val()==""||$(".content").val()==null){
		     $(".content").focus(); // 입력폼으로 돌려내기
		      alert("리뷰를 입력해주세요.");
		      return;
		   }else{
		      if(confirm("리뷰를 수정하시겠습니까?")){
		         $(".rev").submit();
		      }
		   }
		};
		function reviewDelete(){ 
			  if(confirm("리뷰를 수정하시겠습니까?")){
			     $(".rev").submit();
			  }
		};
</script>
<body>
<c:if test="${empty rev.re_content}">
	<form class="rev" action="/reviewI" method="post">
   <div class="review">
   	  <input type="text" value="${res.camp_id}" name="campid" style="display: none;">
   	  <input type="text" value="${res.member_id}" name="memberid" style="display: none;">
      <table>
         <tr>
            <th>후기</th>
            <td><input class="content" name="content" type="text" placeholder="후기" style="width:300px;height:50px; color:black;"></td>
		</tr>
      </table>
      </div>
      </form>
         <input type="button" value="완료" onclick="reviewCheck();" style="width:150px; height:50px; ">
      </c:if>
      
<c:if test="${not empty rev.re_content}">
      <form class="rev" action="/reviewU" method="post">
   <div class="review">
   	  <input type="text" value="${res.camp_id}" name="campid" style="display: none;">
   	  <input type="text" value="${res.member_id}" name="memberid" style="display: none;">
      <table>
         <tr>
            <th>후기</th>
            <td><input class="content" name="content" type="text" placeholder="후기" value="${rev.re_content}" style="width:300px;height:50px; color:black;"></td>
         </tr>
      </table>
      </div>
      </form>
         <input type="button" value="수정" onclick="reviewUpdate();" style="width:150px; height:50px; ">
         <input type="button" value="삭제" onclick="location.href='/del?re_num=${rev.re_num}'" style="width:150px; height:50px; ">
      </c:if>
</body>
</html>