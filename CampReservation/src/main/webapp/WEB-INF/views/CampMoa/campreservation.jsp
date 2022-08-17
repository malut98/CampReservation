<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" href="/resources/css/Main.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/star.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/banner.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/notice.css" type="text/css">
<link rel="StyleSheet" href="/resources/css/Category.css"
	type="text/css">
<link rel="StyleSheet" href="/resources/css/Campreservation.css"
	type="text/css">
<link rel="StyleSheet" href="/resources/css/campreservation_Accept.css"
	type="text/css">
<script type="text/javascript" src="/resources/js/star.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script src="/resources/js/category.js"></script>
<script src="/resources/js/Check_event.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(function() {
		$('.reserv-item-wrapper').slick({
			dots : false,
			infinite : true,
			arrows : false,
			speed : 300,
			slidesToShow : 1,
			slidesToScroll : 1,
			responsive : [ {
				breakpoint : 1024,
				settings : {
					slidesToShow : 1,
					slidesToScroll : 1
				}
			} ]
		});
		var parsedDate = new Date(+new Date() + 3240 * 10000).toISOString().split("T")[0];
		$('.first_date').attr("min",parsedDate);
		$('.last_date').attr("min",parsedDate);
		var first_date = $(".first_date").val(parsedDate);

		$( '.first_date' ).change( function() {
			var first_date = $(".first_date").val();
			var last_date = $(".last_date").val();
			if($(".last_date").val() != "" && first_date > last_date && first_date == last_date){
				alert("날짜를 다시 선택해주세요");
				$(".first_date").val("");
				$(".last_date").val("");
			}

			$('.last_date').attr("min",first_date);
			console.log(first_date);
		});

		$( '.last_date' ).change( function() {
			var first_date = $(".first_date").val();
			var last_date = $(".last_date").val();
			console.log(first_date,last_date);
			if(first_date >= last_date){
				alert("날짜를 다시선택해주세요");
				$(".last_date").val("");
			}else{
				$('.last_date').attr("min",first_date);
			}
			console.log(first_date);
		});
	});
	function count(type)  {
		  // 결과를 표시할 element
		  const resultElement = $('.number_p').val();
		  
		  // 현재 화면에 표시된 값
		  let number = resultElement;
		  
		  
		  // 더하기/빼기
		  if(type === 'plus') {
		    number = parseInt(number) + 1;
		  }else if(type === 'minus')  {
			if(parseInt(number) <= 1){
				return;
			}else{
			   number = parseInt(number) - 1;
			}
		  }
		  
		  // 결과 출력
		  $('.number_p').val(number);
		}
</script>
</head>
<body>
	<jsp:include page="../header.jsp" flush="true"/>
	<div class="category_name" style="width: 100%;">
		<div style="width: 58%; display: flex; justify-content: center;">
			<h1>${camp.camp_name}</h1>
		</div>
	</div>
	<form id="signup" name="reserv" action="/campreservation" method="post">
	<div class="reserv_container">
		<div class="reserv_inner">
			<div class="reserv_wrap">
				<div class="reserv_top">
					<div class="reserv-item-wrapper" style="max-width: 500px">
						<c:choose>
							<c:when test="${empty ci }">
								<c:forEach begin="0" end="10">
									<div class="item">
										<img src="/resources/img/banner/banner_2.jpg" />
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach items="${ci}" var="dto">
									<div class="item">
										<img src="${dto.img}" style="width: 500px; height: 350px;" />
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="reserv_top_right">
					<div style="display: flex; align-items: center;">
						<h3>날짜</h3>
						&nbsp; <input type="date" style="color: black; width: 12vw; height: 2vw;" class="first_date" min=""> ~ 
							<input type="date" style="color: black; width: 12vw; height: 2vw;" class="last_date">
					</div>
					<h3>예약자 정보</h3>
					<div class="reserv_info">
						<span>예약자 명<br> 
						<input type="text" class="info_name"style="color: black"><br>
						</span> 
						<span>전화번호<br>
						<input type="text" class="info_tel" style="color: black"><br>
						</span>
						<span>요청 사항<br> 
						<input type="text" class="info_need"style="color: black">
						</span><br>
					</div>
				</div>
			</div>
			<div class="personnel" >
				<h3>인원</h3> &nbsp;
				<input type='button' class="minus" onclick='count("minus")'value='-'/>
				<input class="number_p" value="1" readonly="readonly">
				<input type='button' class="plus" onclick='count("plus")' value='+'/>
			</div>
		</div>
	</div>
	</form>
	<div style="width: 60%;" class="div_i">
	<ul class="join_box">
		<li class="checkBox check01">
			<ul class="clearfix">
				<li>전체 이용 약관에 동의합니다.(필수)</li>
				<li class="checkAllBtn"><input type="checkbox" name="chkAll" id="chk" class="chkAll">
				</li>
			</ul>
		</li>
		<li class="checkBox check02">
			<ul class="clearfix">
				<li>이용약관 동의(필수)</li>
				<li class="checkBtn"><input type="checkbox" class="chk_n">
				</li>
			</ul>
		<textarea name="" id="">입실시간 : ~~~ 퇴실시간 : ~~~~ 예약관리는 특성상 약간의 시간차에 의하여 오차가 발생할수 있습니다. 오차에 의한 중복예약 발생시 먼저 예약된 예약건이 우선시 되며 이 경우, 취소수수료 없이 전액 환불처리됩니다.숙소의 요청에 따라 일부 요금은 현장에서 결제가 진행될 수 있습니다. 각 숙박시설 정보는 예약을 위한 참고 자료입니다. 숙박시설 내 자체 변동이나 기타 사유로 인해 실제와 차이가 있을 수 있으며, 이에 대해 캠핑모아는 책임을 지지 않습니다. 고객님의 요청사항은 숙박시설에 전달되나, 최종 반영 여부는 예약하신 숙박시설의 결정사항이므로 캠핑모아에서 보장할 수 없는 사항임을 유의하여 주시기 바랍니다. 객실요금은 기준인원에 대한 요금이며 인원 추가시 추가요금이 발생하며 숙소 사정에 따라 현장결제 할 수도 있습니다. 최대인원 이외의 인원은 입실은 불가합니다.</textarea>
		</li>
		<li class="checkBox check03">
			<ul class="clearfix">
				<li>개인정보 수집 및 이용에 대한 안내(필수)</li>
				<li class="checkBtn"><input type="checkbox" class="chk_n">
				</li>
			</ul>
		<textarea name="" id="">여러분을 환영합니다.캠프모아(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 캠프모아 서비스의 이용과 관련하여 캠프모아 서비스를 제공하는 캠프모아 주식회사(이하 ‘캠프모아’)와 이를 이용하는 캠프모아 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 캠프모아 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.</textarea>
		</li>
		<li class="checkBox check03">
			<ul class="clearfix">
				<li>위치정보 이용약관 동의(선택)</li>
				<li class="checkBtn"><input type="checkbox" class="chk_n">
				</li>
			</ul>
		<textarea name="" id="">여러분을 환영합니다.캠프모아 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 캠프모아 서비스의 이용과 관련하여 캠프모아 서비스를 제공하는 캠프모아 주식회사(이하 ‘캠프모아’)와 이를 이용하는 캠프모아 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 캠프모아 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.       </textarea>                
		</li>
		</ul>
		<ul class="footBtwrap clearfix">
			<li><button class="fpmgBt2">${camp.camp_price}원 선 결제 하기</button></li>
		</ul>
    </div>
    <script type="text/javascript">
    $(function () {
		var camp_id = '${camp.camp_id}';
		var member_id = '${reservdto.member_id}';
		var camp_name = '${camp.camp_name}';
		//인풋태그 확인
		function check_input()  {
			var first_date = $(".first_date").val();
			var last_date = $(".last_date").val();
			var info_name = $(".info_name").val();
			var info_tel = $(".info_tel").val();
			var info_need = $(".info_need").val();

			if(first_date == "" || last_date == "" || info_name == "" || info_tel == ""){
				return false;
			}else{
				return true;
			}
		}
        // 체크박스 전체 선택
        var IMP = window.IMP;
        IMP.init('imp78270854');
        var money = `${camp.camp_price}`;
        $(".div_i").on("click", ".chkAll", function () {
            $(this).parents(".join_box").find('input').prop("checked", $(this).is(":checked"));
        });

        // 체크박스 개별 선택
        $(".div_i").on("click", ".chk_n", function () {
            var is_checked = true;

            $(".join_box .chk_n").each(function () {
                is_checked = is_checked && $(this).is(":checked");
            });

            $(".chkAll").prop("checked", is_checked);
        });

        $('.fpmgBt2').click(function(){
    		var checked = $('.chkAll').is(':checked');
			var first_date = $(".first_date").val();
			var last_date = $(".last_date").val();
			var info_name = $(".info_name").val();
			var info_tel = $(".info_tel").val();
			var info_need = $(".info_need").val();
			var number_p = $(".number_p").val();
			console.log(member_id);
			console.log(Number(number_p));
			var number_p_test = Number(number_p); //int형으로 보내기위함
			if(check_input()){
				    if(checked){
                    console.log(money);
                    IMP.request_pay({
                        pg: 'kakaopay.TC0ONETIME',
                        name: '주문명 : 주문명 설정',
                        amount: money,
                        buyer_email: 'iamport@siot.do',
                        buyer_name: '구매자이름',
                        buyer_tel: '010-1234-5678',
                        buyer_addr: '인천광역시 부평구',
                        buyer_postcode: '123-456'
                    }, function (rsp) {
                        console.log(rsp);
                        if (rsp.success) {
                            /*
							msg += '고유ID : ' + rsp.imp_uid;
                            msg += '상점 거래ID : ' + rsp.merchant_uid;
                            msg += '결제 금액 : ' + rsp.paid_amount;
                            msg += '카드 승인번호 : ' + rsp.apply_num;
                            */
                            $.ajax({
                                type: "Post", 
                                url: "/campreservation", //충전 금액값을 보낼 url 설정
                                data: {
                        			"first_date" : first_date, //첫날
                        			"last_date"  : last_date, //마지막날
                        			"info_name"  : info_name, //예약자명
                        			"info_tel"	 : info_tel, // 전화번호
                        			"info_need"  : info_need, // 요청사항
									"number_p"   : number_p_test, //인원수
									"camp_id"	 : camp_id, // 캠핑장 아이디
									"camp_name"	 : camp_name, //캠핑장 이름
                                },success : function(cnt) {
									var msg = ' ';
                                	if(cnt ==0){
										msg = '결제가 완료되었습니다.';
										location.href = "/mypage";
									}else{
										msg = '예약일을 확인해주세요';
									}
									alert(msg);
								},error : function(cnt) {
									alert("error");
								}
                            });
                        } else {
                            var msg = '결제에 실패하였습니다.';
                            msg += '에러내용 : ' + rsp.error_msg;
							alert(msg);
                        }
					});
            		}else{
						alert("모든 항목에 동의를 해주세요.")
					}
			}else{
				alert("필수 기입 사항을 입력해주세요.");
			}
    		
    			
    	});
    });
    </script>
    <br><br><br><br><br><br>
    <jsp:include page="../Footer2.jsp" flush="true"/>
</body>
</html>