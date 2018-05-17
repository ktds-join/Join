<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>TEST::tendency matching</title>
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

<body>
<!-- header :: navbar 부분 -->
	<jsp:include page="/WEB-INF/view/template/navbar.jsp" />

<h1>당신이 선호하는 여행 스타일은?</h1>
<!-- <div class="jquery-script-ads" style="margin-top:30px" align="center">
<script type="text/javascript">
<!--
google_ad_client = "ca-pub-2783044520727903";
/* jQuery_demo */
google_ad_slot = "2780937993";
google_ad_width = 728;
google_ad_height = 90;
//
</script>
<script type="text/javascript"
src="https://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
</div> -->


		<form id="styleForm">
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
<!--
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

</script>-->

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
