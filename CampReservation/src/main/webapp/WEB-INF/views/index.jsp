<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" href="css/Main.css" type="text/css">
<link rel="StyleSheet" href="css/star.css" type="text/css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	function init(){

		  //estrelas

		  var style = ["style1", "style2", "style3", "style4"];
		  var tam = ["tam1", "tam1", "tam1", "tam2", "tam3"];
		  var opacity = ["opacity1", "opacity1", "opacity1", "opacity2", "opacity2", "opacity3"];

		  function getRandomArbitrary(min, max) {
		    return Math.floor(Math.random() * (max - min)) + min;
		  }

		  var estrela = "";
		  var qtdeEstrelas = 250;
		  var noite = document.querySelector(".constelacao");
		  var widthWindow = window.innerWidth;
		  var heightWindow = window.innerHeight;

		  for (var i = 0; i < qtdeEstrelas; i++) {
		    estrela += "<span class='estrela " + style[getRandomArbitrary(0, 4)] + " " + opacity[getRandomArbitrary(0, 6)] + " "
		    + tam[getRandomArbitrary(0, 5)] + "' style='animation-delay: ." +getRandomArbitrary(0, 9)+ "s; left: "
		    + getRandomArbitrary(0, widthWindow) + "px; top: " + getRandomArbitrary(0, heightWindow) + "px;'></span>";
		  }

		  noite.innerHTML = estrela;

		  //meteoros

		  var numeroAleatorio = 5000;

		  setTimeout(function(){
		    carregarMeteoro();
		  }, numeroAleatorio);

		  function carregarMeteoro(){
		    setTimeout(carregarMeteoro, numeroAleatorio);
		    numeroAleatorio = getRandomArbitrary(5000, 10000);
		    var meteoro = "<div class='meteoro "+ style[getRandomArbitrary(0, 4)] +"'></div>";
		    document.getElementsByClassName('chuvaMeteoro')[0].innerHTML = meteoro;
		    setTimeout(function(){
		      document.getElementsByClassName('chuvaMeteoro')[0].innerHTML = "";
		    }, 1000);
		  }

		}

		window.onload = init;
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
				</ul>
			</div>
			<div class="profile">
				<ul>
					<li><a href="/login">로그인</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="noite"></div>

	<div class="constelacao"></div>

	<div class="lua">
		<div class="textura"></div>
	</div>

	<div class="chuvaMeteoro"></div>

	<div class="floresta">
		<img
			src="https://raw.githubusercontent.com/interaminense/starry-sky/master/src/img/bgTree.png"
			alt="" />
	</div>
</body>
</html>