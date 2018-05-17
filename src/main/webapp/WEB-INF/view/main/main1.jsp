<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/alert.css"/>"/>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>


 <!-- Google Fonts -->
  <link href="<c:url value="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700"/>" rel="stylesheet">

  <!-- Bootstrap CSS -->
  <link href="<c:url value="lib/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">

  <!-- Main CSS -->
  <link href="<c:url value="css/style.css"/>" rel="stylesheet">


<title>있음없음페이지</title>

<style>
body {
  background: #fff;
  color: #666666;
  font-family: "Open Sans", sans-serif;
}


=======
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>TEST::tendency matching</title>
<style>
*, *:before, *:after {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Roboto';
  padding: 60px 20px;
  background-color:#fafafa;
}
h1 { margin-top:100px; text-align:center;}
@media (min-width: 600px) {

body { padding: 60px; }
}

.preBtn {
	background: #3b60d9;
	color: #0a0a0a;
	padding: 20px;
}

#preBtn {
	background: #3b60d9;
	color: #0a0a0a;
	padding: 20px;
}

.nextBtn {
	background: #3b60d9;
	color: #0a0a0a;
	padding: 20px;
}

#nextBtn {
	background: #3b60d9;
	color: #0a0a0a;
	padding: 20px;
}



.range-slider { margin: 60px 0 0 0%; }

.range-slider { width: 100%; }

.range-slider__range {
  -webkit-appearance: none;
 width: calc(100% - (73px));
  height: 10px;
  border-radius: 5px;
  background: #d7dcdf;
  outline: none;
  padding: 0;
  margin: 0;
}
.range-slider__range::-webkit-slider-thumb {
 -webkit-appearance: none;
 appearance: none;
 width: 20px;
 height: 20px;
 border-radius: 50%;
 background: #2c3e50;
 cursor: pointer;
 -webkit-transition: background .15s ease-in-out;
 transition: background .15s ease-in-out;
}
.range-slider__range::-webkit-slider-thumb:hover {
 background: #1abc9c;
}
.range-slider__range:active::-webkit-slider-thumb {
 background: #1abc9c;
}
.range-slider__range::-moz-range-thumb {
 width: 20px;
 height: 20px;
 border: 0;
 border-radius: 50%;
 background: #2c3e50;
 cursor: pointer;
 -webkit-transition: background .15s ease-in-out;
 transition: background .15s ease-in-out;
}
.range-slider__range::-moz-range-thumb:hover {
 background: #1abc9c;
}
.range-slider__range:active::-moz-range-thumb {
 background: #1abc9c;
}
.range-slider__range:focus::-webkit-slider-thumb {
 -webkit-box-shadow: 0 0 0 3px #fff, 0 0 0 6px #1abc9c;
 box-shadow: 0 0 0 3px #fff, 0 0 0 6px #1abc9c;
}

.range-slider__value {
  display: inline-block;
  position: relative;
  width: 60px;
  color: #fff;
  line-height: 20px;
  text-align: center;
  border-radius: 3px;
  background: #2c3e50;
  padding: 5px 10px;
  margin-left: 8px;
}

.range-slider__value:after {
  position: absolute;
  top: 8px;
  left: -7px;
  width: 0;
  height: 0;
  border-top: 7px solid transparent;
  border-right: 7px solid #2c3e50;
  border-bottom: 7px solid transparent;
  content: '';
}

::-moz-range-track {
 background: #d7dcdf;
 border: 0;
}
 input::-moz-focus-inner, input::-moz-focus-outer {
 border: 0;
}
>>>>>>> tendency-sol
</style>
</head>

<body>
<<<<<<< HEAD
	<!-- 헤더  -->
	<header id = "header">
		<!-- #로고 왼쪽으로 보내기 -->
		<div class = "container">
			<div id ="logo">이미지 넣기</div>	
		</div>
		
		<nav id ="nav-menu-container">
			<ul class ="nav-menu">
				<li class ="menu-acitve"><a href="#intro">StartWith</a></li>
				<li><a href ="epi.jsp">Epilogue</a></li>
				<!-- <li><a href ="login.jsp">Login</a></li> -->
				<!-- #menu-has-children -->
				<li class = "menu-dropdown"><a href="">MyPage</a>
					<div>마이페이지 관련 정보 입력 </div></li>
			</ul>
		</nav>
		<span>${sessionScope.__MEMBER__.memberEmail}님 반갑습니다</span>
		<a href="<c:url value="/logout"/>">[로그아웃]</a>
		<a href="<c:url value="/login"/>">[로그인]</a>
	</header>


  <!-- Template Main Javascript File -->
<%--   <script src="<c:url value="js/main.js"/>"></script>
 --%></body>
</html>
=======
<h1>당신이 선호하는 여행 스타일은?</h1>
<div class="jquery-script-ads" style="margin-top:30px" align="center">
<script type="text/javascript">
<!--
google_ad_client = "ca-pub-2783044520727903";
/* jQuery_demo */
google_ad_slot = "2780937993";
google_ad_width = 728;
google_ad_height = 90;
//-->
</script>
<!-- <script type="text/javascript"
src="https://pagead2.googlesyndication.com/pagead/show_ads.js">
</script> -->
</div>

<form id="style">
  <div class="range-slider">
	  <input id="styleInput1" name="style1" class="range-slider__range" type="range" value="100" min="0" max="200" step="50">
	  <span id="style1" class="range-slider__value">0</span> 
  </div>
 
  <div class="range-slider">
  	<input id="styleInput2" name="style2" class="range-slider__range" type="range" value="100" min="0" max="200" step="50">
  	<span id="style2" class="range-slider__value">0</span> 
  </div>
  
  <div class="range-slider">
	  <input id="styleInput3" name="style3" class="range-slider__range" type="range" value="100" min="0" max="200" step="50">
	  <span id="style3" class="range-slider__value">0</span> 
  </div>
  
  <div class="range-slider">
	  <input id="styleInput4" name="style4" class="range-slider__range" type="range" value="100" min="0" max="200" step="50">
	  <span id="style4" class="range-slider__value">0</span> 
  </div>
  
  <div class="range-slider">
	  <input id="styleInput5" name="style5" class="range-slider__range" type="range" value="100" min="0" max="200" step="50">
	  <span id="style5" class="range-slider__value">0</span> 
  </div>
  </form>
  <!-- TODO: url 보내기 -->  
  <button type="button" class="preBtn" id="preBtn">이전으로</button>
  <button type="button" class="nextBtn" id="nextBtn">매칭하기</button>

  

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
<script>

var rangeSlider = function(){
  var slider = $('.range-slider'),
      range = $('.range-slider__range'),
      value = $('.range-slider__value');
    
  slider.each(function(){

    value.each(function(){
      var value = $(this).prev().attr('value');
      $(this).html(value);
    });

    range.on('input', function(){
      $(this).next(value).html(this.value);
    });
  });
};

rangeSlider();
</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
  <script type="text/javascript">
  $().ready(function(){
	  console.log("ready");
	  var value = $("#style1").text();
	  console.log(value);
	  
	  $("#preBtn").click(function(){
		  console.log("click");
		  $("#styleInput1").val($("#style1").text());
		  console.log($("#styleInput1").val());
	  })
	  
	  $("#nextBtn").click(function(){
		  console.log("click");
		  $("#styleInput1").val($("#style1").text());
		  $("#styleInput2").val($("#style2").text());
		  $("#styleInput3").val($("#style3").text());
		  $("#styleInput4").val($("#style4").text());
		  $("#styleInput5").val($("#style5").text());
		  $("#style").attr({
			  "method" : "post",
			  "action" : "<c:url value="/main"/>"
		  }).submit();
	  })
  })
  </script>
</body>
</html>
>>>>>>> tendency-sol
