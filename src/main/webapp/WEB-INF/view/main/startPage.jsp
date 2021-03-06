<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>startPage</title>

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

<!-- 제이쿼리 -->
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
$().ready(function(){	
	$(".btn-get-started").click(function(){
		$(".btn-get-started").hide();
		$("#locationStatus").show();
		
	});
	
});
</script>

</head>

<body>
<!--==========================
    Header
  ============================-->
  <header id="header" style="position:fixed">
    <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="#intro" class="scrollto">JOIN</a></h1>
      </div>

      <nav id="nav-menu-container"> 
        <ul class="nav-menu">
          <li class="menu-active"><a href="#intro">Home</a></li>
          <li class="menu"><a href="/Join/login">Login</a>
          <li class="menu-has-children"><a href="">Mypage</a>
            <ul>
              <li>
              <div style ="background-color:red;height:400px;width:180px"><a href="#">it gonna be DIV</a></div>
              </li>
              
            </ul>
          </li>
          <li><a href="/epi">Epilogue</a></li>
          
        </ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->
  <!--==========================
    Intro Section
  ============================-->
  <section id="intro">
    <div class="intro-container">
      <div id="introBackground" class="carousel  slide carousel-fade" data-ride="carousel">

        <ol class="carousel-indicators"></ol>

        <div class="carousel-inner" role="listbox">

          <div class="carousel-item active">
            <div class="carousel-background"><img src="<c:url value="static/img/intro/beach.jpg"/>" alt=""></div>
            <div class="carousel-container">
              <div class="carousel-content">            
                <h2>FIND YOUR TRAVEL MATE!</h2>
                <p>We provide a trip that suits your travel preferences</p>
                
                <a href="#featured-services" class="btn-get-started scrollto">Get Started</a>
                <!-- 이 밑으로 어펜드가 될꺼야 -->
                <div id ="locationStatus" style ="display:none;">
                	
                	<div id ="locationExist" style ="display:inline-block;"><a href ="#">있음</a></div>
                	<div id ="locationNotExist" style ="display:inline-block;"><a href ="#">없음</a></div>
                	
                
                </div>             
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section><!-- #intro -->

<!-- footer -->
	<jsp:include page="/WEB-INF/view/template/footer.jsp" />
  

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

  <!-- JavaScript Libraries -->
  <script src="<c:url value="static/lib/jquery/jquery.min.js"/>"></script>
<%--   <script src="<c:url value="static/lib/jquery/jquery-migrate.min.js"/>"></script>
  <script src="<c:url value="static/lib/bootstrap/js/bootstrap.bundle.min.js"/>"></script> --%>
	<script src="<c:url value="static/lib/easing/easing.min.js"/>"></script><!-- go to top  -->
  <script src="<c:url value="static/lib/superfish/superfish.min.js"/>"></script><!-- dropdown pointer -->
  <script src="<c:url value="static/lib/wow/wow.min.js"/>"></script><!-- 메인 글자 가운데 정렬   -->
<%--   <script src="<c:url value="static/lib/waypoints/waypoints.min.js"/>"></script> --%>
<%--   <script src="<c:url value="static/lib/counterup/counterup.min.js"/>"></script> --%>
<%--   <script src="<c:url value="static/lib/owlcarousel/owl.carousel.min.js"/>"></script>
  <script src="<c:url value="static/lib/isotope/isotope.pkgd.min.js"/>"></script>
  <script src="<c:url value="static/lib/lightbox/js/lightbox.min.js"/>"></script>
  <script src="<c:url value="static/lib/touchSwipe/jquery.touchSwipe.min.js"/>"></script> --%>

  <!-- Template Main Javascript File -->
  <script src="<c:url value="static/js/main.js"/>"></script>



</body>
</html>
