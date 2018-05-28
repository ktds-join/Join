<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<!-- 삭제하지마셈  추가 -->
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">
  <!-- Favicons :: 브라우저 주소창에 표시되는 대표아이콘-->
  <link href="<c:url value="static/img/favicon.png"/>" rel="icon">
  <link href="<c:url value="static/img/apple-touch-icon.png"/>" rel="apple-touch-icon">
  <!-- Google Fonts -->
  <link href="<c:url value="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700"/>" rel="stylesheet">
  <!-- Bootstrap CSS File -->
  <link href="<c:url value="static/lib/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">
  <!-- Libraries CSS Files -->
  <link href="<c:url value="static/lib/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet">
  <link href="<c:url value="static/lib/animate/animate.min.css"/>" rel="stylesheet">
  <!-- Main Stylesheet File -->
  <link href="<c:url value="static/css/style.css"/>" rel="stylesheet">
  <!-- 삭제하지마셈  추가 -->
 <link href="<c:url value="static/css/tendency.css"/>" rel="stylesheet">
 
</head>
<style>

</style>
<body>
<!-- header :: navbar 부분 -->
	<jsp:include page="/WEB-INF/view/template/navbar.jsp" />


<div class="container">
	<div id="wrapper">
		<form id="styleForm">
			<h2>선호하는 여행 스타일을 선택해주세요!</h2>
		
			  
		 
		   <div class="range-slider">도심지
		  	<input id="memberStyle1" name="memberStyle1" class="range-slider__range" type="range" value="100" min="0" max="200" step="50">
		  </div>
		 
		   <div class="range-slider">
		  	<input id="memberStyle2" name="memberStyle2" class="range-slider__range" type="range" value="100" min="0" max="200" step="50">
		  </div>
		  
		  <div class="range-slider">
			  <input id="memberStyle3" name="memberStyle3" class="range-slider__range" type="range" value="100" min="0" max="200" step="50">
		  </div>
		  
		  <div class="range-slider">
			  <input id="memberStyle4" name="memberStyle4" class="range-slider__range" type="range" value="100" min="0" max="200" step="50">
		  </div>
		  
		  <div class="range-slider">
			  <input id="memberStyle5" name="memberStyle5" class="range-slider__range" type="range" value="100" min="0" max="200" step="50">
		<!--  <span id="memberStyle5" class="range-slider__value">0</span> --> 
		  </div> 
		  
		  </form>
		  
			  <div class="button-1">
			    <a href="<c:url value="/map"/>"> 뒤로가기 </a>
			    <a id="nextBtn"> 매칭하기 </a>
		  <!-- <button type="button" class="preBtn" id="preBtn">이전으로</button>
		  <button type="button" class="nextBtn" id="nextBtn">매칭하기</button> -->
		</div>
  	</div>
 </div>
<!-- 삭제하지마셈 추가 -->
<!-- 일단은 br로 사이 띄어놓겠음 -->
	<br><br><br><br><br>
	<!-- footer -->
	<jsp:include page="/WEB-INF/view/template/footer.jsp" />
	  <!-- JavaScript Libraries -->
	  <script src="<c:url value="static/lib/jquery/jquery.min.js"/>"></script>
	  <script src="<c:url value="static/lib/easing/easing.min.js"/>"></script><!-- go to top  -->
	  <script src="<c:url value="static/lib/superfish/superfish.min.js"/>"></script><!-- dropdown pointer -->
	  <script src="<c:url value="static/lib/wow/wow.min.js"/>"></script><!-- 메인 글자 가운데 정렬   -->
	  <script src="<c:url value="static/js/main.js"/>"></script>  
<!-- 삭제하지마셈 추가 -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
		crossorigin="anonymous"></script> 

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

<script
	  src="https://code.jquery.com/jquery-3.3.1.js"
	  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	  crossorigin="anonymous">
</script>
  
  <script type="text/javascript">
  	$().ready(function(){
	  $("#nextBtn").click(function(){
		 
		  console.log("click");
		  var style1 = $("#styleInput1").val($("#style1").text());
		  var style2 = $("#styleInput2").val($("#style2").text());
		  var style3 = $("#styleInput3").val($("#style3").text());
		  var style4 = $("#styleInput4").val($("#style4").text());
		  var style5 = $("#styleInput5").val($("#style5").text());
		  
		  console.log(style1);
		  console.log(style2);
		  console.log(style3);
		  console.log(style4);
		  console.log(style5);
		 
		
		  var result = confirm('매칭하시겠습니까?');
		  if (result) {
			  
		  
		   $("#styleForm").attr({
			  "method" : "post",
			  "action" : "<c:url value="/tendency"/>"
		  }).submit(); 
		  }
		  });
  });
  </script>
  
</body>
</html>
