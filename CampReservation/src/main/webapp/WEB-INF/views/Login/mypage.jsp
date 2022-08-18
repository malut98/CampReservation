
<%@page import="com.camp.campreservation.Dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/banner.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/notice.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/star.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Category.css"
	type="text/css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script src="/resources/js/category.js"></script>
<script>
function wtype(){
	window.open("/mypagewtype","_blank","width=700px,height=700px");
}
function rev(reser_id,camp_id,member_id){
	$.ajax({
    	type: 'post',	
    	url: 're',
    	data: {"reser_id":reser_id},
    	error: function (request, error) {
    		alert("fail");
    		console.log("code:"+request.status + "\n" + "message:"+request.responseText+ "\n" + "error:"+error);
    	},
    	success: function (result) {
    		if(result==1){
    			window.open('/write?reser_id='+reser_id+'&camp_id='+camp_id+'&member_id='+member_id, '', 'width=700, height=500, location=no, status=no, scrollbars=yes');
    		}else if(result==-1){
    			alert("여행이 아직 끝나지 않았습니다.");
    		}
    	}
    });
}
</script>
 <style>

 </style>
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/mypage.css" type="text/css">
</head>
<body>
<jsp:include page="../header.jsp" flush="true"/>
		
    <div id="container">

        <article>
            <div class="container">

                <div class="title-box">
                    <div class="title-text">
                        <div>마이페이지</div>
                    </div>
                </div>

                <div class="content">

                    <div class="content01">
                        <div class="content-userinfo">
                            <div class="content-text">이름</div>
                            <input class="content-whitebox" type="text" id="membername" name="membername"
                                readonly="readonly" value="${dto.membername }" >
                            <div class="content-text">휴대폰</div>
                            <input class="content-whitebox" type="text" id="memberphone" name="memberphone"
                                readonly="readonly" value="${dto.memberphone }">
                            <div class="content-text">보유포인트</div>
                            <input class="content-whitebox" type="text" id="memberpoint" name="memberpoint"
                                readonly="readonly" value="${dto.pointer }">
                        </div>

                        <div class="content-likelist">
                            <div class="content-likelistfont">좋아요 리스트</div>
                            <div class="content-likes">

                                <c:choose>
                                    <c:when test="${empty camp }">
                                        <tr>
                                            <td colspan="3">"좋아요 누른 항목이 없습니다."</td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${camp}" var="dto" varStatus="status">
                                            <a href="/clist/cdetail?camp_id=${dto.camp_id}&camp_se=${dto.camp_se}&memberid=${sessionScope.memberid}">${dto.camp_name}</a><br><br>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>
                    </div>

                    <div class="content02">
                        <div class="reservation-box">
                            <div class="reservation-title">
                                <div>예약완료</div>
                                <div>한줄후기</div>
                                <br><br><br><br>
                            </div>
                            <div class="reservation-review">
                                <c:choose>
                                <c:when test="${empty res }">
                                    <tr>
                                        <td colspan="2">"조회된 이력이 없습니다.!"</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                <c:forEach items="${res}" var="dt" varStatus="status">
                                <div  style="display: flex; text-align: center; justify-content: center; align-items: center;">
                                        <div style="width: 50%;height: 40px;">${dt.camp_name}</div>
                                        <div style="width: 50%; height: 40px;"><input type="button" name="review" id="review" value="후기작성하기" style="color: black;" onclick="rev(${dt.reser_id},${dt.camp_id},'${dt.member_id}');"></div>
                                		<br>
                                </div>
                                </c:forEach>
                                </c:otherwise>
                                </c:choose>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </article>

    </div>
	<jsp:include page="../Footer2.jsp" flush="true"/>
</body>
</html>