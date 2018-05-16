<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>TEST::tendency matching</title>
<style>
</style>

</head>

<body>
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
