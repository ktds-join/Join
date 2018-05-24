<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>startPage</title>
<!-- sol madal  -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<!-- /sol madal  -->


<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicons :: 브라우저 주소창에 표시되는 대표아이콘-->
<link href="<c:url value="static/img/favicon.png"/>" rel="icon">
<link href="<c:url value="static/img/apple-touch-icon.png"/>"
	rel="apple-touch-icon">
<!-- Google Fonts -->
<link
	href="<c:url value="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700"/>"
	rel="stylesheet">

<!-- Bootstrap CSS -->
<link href="<c:url value="lib/bootstrap/css/bootstrap.min.css"/>"
	rel="stylesheet">

<!-- Main CSS -->
<link href="<c:url value="css/style.css"/>" rel="stylesheet">


<title>있음없음페이지</title>

<style>
body {
	background: #fff;
	color: #666666;
	font-family: "Open Sans", sans-serif;
}
</style>
</head>

<body>
	<!-- 헤더  -->
	<header id="header">
		<!-- #로고 왼쪽으로 보내기 -->
		<div class="container">
			<div id="logo">이미지 넣기</div>
		</div>

		<nav id="nav-menu-container">
			<ul class="nav-menu">
				<li class="menu-acitve"><a href="#intro">StartWith</a></li>
				<li><a href="epi.jsp">Epilogue</a></li>
				<!-- <li><a href ="login.jsp">Login</a></li> -->
				<!-- #menu-has-children -->
				<li class="menu-dropdown"><a href="">MyPage</a>
					<div>마이페이지 관련 정보 입력</div></li>
			</ul>
		</nav>
		<span>${sessionScope.__MEMBER__.memberEmail}님 반갑습니다</span> <a
			href="<c:url value="/logout"/>">[로그아웃]</a> <a
			href="<c:url value="/login"/>">[로그인]</a>
	</header>


	<!-- Template Main Javascript File -->
	<%--   <script src="<c:url value="js/main.js"/>"></script>
 --%>

</body>
<!-- Bootstrap CSS File -->
<link href="<c:url value="static/lib/bootstrap/css/bootstrap.min.css"/>"
	rel="stylesheet">
<!-- Libraries CSS Files -->
<link
	href="<c:url value="static/lib/font-awesome/css/font-awesome.min.css"/>"
	rel="stylesheet">
<link href="<c:url value="static/lib/animate/animate.min.css"/>"
	rel="stylesheet">
<!-- Main Stylesheet File -->
<link href="<c:url value="static/css/style.css"/>" rel="stylesheet">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- 제이쿼리 -->
<script type="text/javascript"
	src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>


</head>

<body>
	<!--==========================
    Header :: 시작페이지에선 구분 안하려고 함
  ============================-->
	<header id="header" style="position: fixed">
		<div class="container-fluid">

			<div id="logo" class="pull-left">
				<h1>
					<a href="#intro" class="scrollto">JOIN</a>
				</h1>
			</div>

			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li class="menu-active"><a href="#intro">Home</a></li>
					<c:if test="${empty sessionScope.__MEMBER__}">
						<li class="menu"><a href="/Join/login">Login</a></li>
					</c:if>
					<c:if test="${not empty sessionScope.__MEMBER__}">
						<li class="menu-has-children"><a href="">Mypage</a>
							<ul>
								<li>
									<div style="background-color: red; height: 400px; width: 180px">
										<a href="<c:url value="#"/>"> it gonna be DIV </a>
												<!-- TODO : 여기에 프로필 사진 및 회원 정보 추가 -->
												<!-- Btn click -> modal -->
												<!-- Modal -->
												<img src="<c:url value="/profile/${sessionScope.__MEMBER__.memberId}"/>"/>
												<div class="container">
													<!-- Trigger the modal with a button -->
 											   		<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">sol Modal</button>
												</div>
												
									</div>
								</li>
							</ul>
						</li>
					</c:if>
					
									
					 <li><a href="/epi">Epilogue</a></li> 

				</ul>
			</nav>
  
			<!-- #nav-menu-container -->
		</div>
	</header>
	<!-- #header -->
	<!--==========================
=======
  <header id="header" style="position:fixed">
    <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="#intro" class="scrollto">JOIN</a></h1>
      </div>

      <nav id="nav-menu-container"> 
        <ul class="nav-menu">
          <li class="menu-active"><a href="#intro">Home</a></li>
          <c:if test="${empty sessionScope.__MEMBER__}">
          <li class="menu"><a href="/Join/login">Login</a></li>
          </c:if>
          <c:if test="${not empty sessionScope.__MEMBER__}">
          <li class="menu-has-children"><a href="">Mypage</a>
          
            <ul>
              <li>
              	<div style ="background-color:red;height:400px;width:180px">
              		<a href="#">it gonna be DIV</a>
              		<img src="<c:url value="profile/${sessionScope.__MEMBER__.memberId}"/>"/>
              	</div>
              </li>
              
            </ul>
          </li>
          </c:if>
          <li><a href="/epi">Epilogue</a></li>
          
        </ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->
  <!--==========================
>>>>>>> 06d8f1f0a8cd6fdfff84453a90e1f87bbc20958f
    Intro Section
  ============================-->
  
<!-- sol Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
<!-- / sol Modal -->


	<section id="intro">
		<div class="intro-container">
			<div id="introBackground" class="carousel  slide carousel-fade"
				data-ride="carousel">

				<ol class="carousel-indicators"></ol>

				<div class="carousel-inner" role="listbox">

					<div class="carousel-item active">
						<div class="carousel-background">
							<img src="<c:url value="static/img/intro/beach.jpg"/>" alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>FIND YOUR TRAVEL MATE!</h2>
								<p>We provide a trip that suits your travel preferences</p>

								<a href="#featured-services" class="btn-get-started scrollto">Get
									Started</a>
								<!-- 이 밑으로 어펜드가 될꺼야 -->
								<div id="locationStatus">

									<div id="locationExist">
										<a href="#">있음</a>
									</div>
									<div id="locationNotExist">
										<a href="#">없음</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- #intro -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/template/footer.jsp" />


	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<!-- JavaScript Libraries -->
	<script src="<c:url value="static/lib/jquery/jquery.min.js"/>"></script>
	<script src="<c:url value="static/lib/easing/easing.min.js"/>"></script>
	<!-- go to top  -->
	<script src="<c:url value="static/lib/superfish/superfish.min.js"/>"></script>
	<!-- dropdown pointer -->
	<script src="<c:url value="static/lib/wow/wow.min.js"/>"></script>
	<!-- 메인 글자 가운데 정렬   -->

	<!-- Template Main Javascript File -->
	<script src="<c:url value="static/js/main.js"/>"></script>
</body>
</html>
