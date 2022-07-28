<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org"
   xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/star.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/banner.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/notice.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/camplist.css"
   type="text/css">
<link rel="StyleSheet" href="/resources/css/Category.css"
   type="text/css">
<script type="text/javascript" src="/resources/js/star.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet"
   href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="/resources/js/category.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="indexListAjax2">
	<div class="pagingDiv">
         	<c:if test="${page.prev}">
            	<div onclick="pag(${page.getStartPage()-1});">&laquo;</div>
         	</c:if>
         	<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
            	<div onclick="pag(${idx});">${idx}</div>
         	</c:forEach>
         	<c:if test="${page.next}">
            	<div onclick="pag(${page.getEndPage()+1});">&raquo;</div>
         	</c:if>
      </div>

</div>


	<div id="indexListAjax">
            	<c:forEach items="${camp}" var="dto" varStatus="status">
            	<c:if test="${status.count % 2 ==1 or status.count == 1}">
                	<div class="wrap">
            	</c:if> 
               		<div class="left" id="${dto.camp_id}">
                  		<table class="table_left">
                     		<tr>
                        		<td class="table_img" colspan="2"><c:if test="${dto.camp_img eq 'x'}">
                              		<img style="width: 430px; height: 250px;"
                                 		src="/resources/Img/noimage-black.png"
                                 		onclick="location.href='cdetail?camp_id=${dto.camp_id}'">
                           </c:if><c:if test="${dto.camp_img ne 'x'}">
                              		<img style="width: 430px; height: 250px;"
                                		src="${dto.camp_img}"
                                 		onclick="location.href='cdetail?camp_id=${dto.camp_id}'">
                           </c:if></td>
                     		</tr>
                     		<tr>
                        		<td  class="table_name">${dto.camp_name}</td>
                        		<td style="text-align: center;"><img
                          			style="width: 20px; height: 20px;"
                           			src="/resources/Img/unlike.png"></td>
                     		</tr>
                     		<tr>
                        		<td class="table_addr">${dto.camp_addr}</td>
                        		<td style="text-align: center;"><button id="${dto.camp_id}"
                              		onclick="compare('${dto.camp_id}' , '${dto.camp_img}' , '${dto.camp_name}' , '${dto.camp_addr}'); return false;">비교</button>
                        		</td>
                     		</tr>
                     		<tr>
                        		<td>&nbsp;</td>
                     		</tr>
                  		</table>
               		</div>
               	<c:if test="${fn:length(calculateList) %2 == 1 and status.count == list.size}">
             </div>
               	</c:if>
            	<c:if test="${status.count % 2 ==0}">
             </div>
               </c:if>
     	 </c:forEach>
      
	</div>
</body>
</html>