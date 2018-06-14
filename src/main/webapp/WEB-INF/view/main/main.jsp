<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>startPage</title>
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

<!-- 제이쿼리 -->
<script type="text/javascript"
	src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<title>있음없음페이지</title>
<script type="text/javascript">
$().ready(function(){
	$(".btn-get-started").click(function(){
		$(this).hide();
		$("#locationStatus").show();
	});
	
	$("#locationNotExist").click(function(){
		$("#mainIntro").hide();
	});
	$("#myPageBtn").click(function(){
		location.href="<c:url value="/myPage"/>";
	});

	/* TODO 닫기 혹은 뒤로 가기 버튼으로 구현할라고 */
	$("#closeBtn").click(function(){
		$("#locationStatus").unbind('click');
	});

	/* 체크박스 전체선택 전체해제 */
	$("#allElements").click(function(){
		if($("#allElements").prop("checked")){
			$("input[type=checkbox]").prop("checked",true);
		}else{
			$("input[type=checkbox]").prop("checked",false);
		}
	});
	
	$("#needToLogin").click(function(){
		alert("여행지 추천을 받으려면 로그인이 필요합니다.");
	});
	
	$("#needToSelect").click(function(){
		$("#tripStyle").show();
	});
	
	$("#selectedOptions").click(function(){
		var tripStyleForm = $("#tripStyleForm");
		tripStyleForm.attr({
			"method" : "post",
			"action" : "<c:url value="/recommend"/>"
		});
		tripStyleForm.submit();
	});
	
});
</script>
<style>
.cityBlock{
display:none;
}
</style>
</head>
<body>

	<!--==========================
    Header :: 시작페이지에선 구분 안하려고 함
  ============================-->
	<header id="header" style ="text-decoration:none;">
		<div class="container-fluid">

			<div id="logo" class="pull-left">
				<h1>
					<a href="<c:url value="/main"/>" class="scrollto">JOIN</a>
				</h1>
			</div>

			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li class="menu-active"><a href="<c:url value="/main"/>">Home</a></li>
					<li><a href="<c:url value ="/epiList"/>">Epilogue</a></li>
					<c:if test="${empty sessionScope.__MEMBER__}">
						<li class="menu"><a href="<c:url value="/login"/>">Login</a></li>
					</c:if>
					<c:if test="${not empty sessionScope.__MEMBER__}">
						<li class="menu-has-children"><a href="<c:url value="/myPage"/>">Mypage</a>
							<ul>
								<li>
									<div id ="navMypage">
										<h4>My Info</h4>
										<!-- 일단 css 추가하려고 이미지 파일 올림 -->
										<p class ="profileImgPart">
										<img id = "profileImg" src="<c:url value ="/static/img/default.jpg"/>"/>
										</p>
										<p>${sessionScope.__MEMBER__.memberNickname}</p>
										<p>${sessionScope.__MEMBER__.memberEmail}</p>
												<!-- TODO : 여기에 프로필 사진 및 회원 정보 추가 -->
												<%-- <img id = "profileImg" src="<c:url value="/profile/${sessionScope.__MEMBER__.memberId}"/>"/> --%>
										<button type="button" id ="myPageBtn" class="btn btn-info btn-lg">myPage</button>	
									</div>
								</li>
							</ul>
						</li>
						<li class="menu"><a href="<c:url value="/logout"/>">Logout</a></li>
					</c:if>
				</ul>
			</nav>
  <!-- #nav-menu-container -->
		</div>
	</header>
	
  <!--==========================
    Intro Section
  ============================-->
	<section id="intro">
		<div class="intro-container">
			<div id="introBackground" class="carousel  slide carousel-fade"
				data-ride="carousel">
				<div class="carousel-inner" role="listbox">

					<div class="carousel-item active">
						<div class="carousel-background">
							<img src="<c:url value="static/img/intro/beach.jpg"/>" alt="">
						</div>
						<div class="carousel-container">
							<div id = "mainIntro" class="carousel-content">
								<h2>FIND YOUR TRAVEL MATE!</h2>
								<p>We provide a trip that suits your travel preferences</p>
								<a href="#" class="btn-get-started scrollto">Get Started</a>
								<!-- 이 밑으로 어펜드가 될꺼야 -->
								<div id="locationStatus">
									<div id="locationExist">
										<a href="<c:url value="/recommend"/>">있음</a>
									</div>
									<div id="locationNotExist">	
									<c:if test="${empty sessionScope.__MEMBER__}">
										<a href="<c:url value="/login"/>" id = "needToLogin">없음</a>
									</c:if>
									
									<c:if test="${not empty sessionScope.__MEMBER__}">
										<a href="#" id ="needToSelect">없음</a>
									</c:if>
									
									</div>
									<a href="#" id = "closeBtn"><img style = "width:20px;height:20px" src ="<c:url value ="/static/img/close.png"/>"/></a>
								</div>
							</div>
							<!-- 여행 스타일 선택 div -->
							<div id = "tripStyle" class="carousel-content">
									
									<form:form>
										
										<%-- <form:checkbox path="tripStyleId" id ="allElements" name="tripStyleAll" value = "style0"></form:checkbox>all
										<form:checkbox path="tripStyleId" id ="element" name="tripStyleId" value = "style1"></form:checkbox>1
										<form:checkbox path="tripStyleId" id ="element" name="tripStyleId" value = "style2"></form:checkbox>2
										<form:checkbox path="tripStyleId" id ="element" name="tripStyleId" value = "style3"></form:checkbox>3 --%>
										<div class ="styleBlock"><input type ="checkbox" id ="element" name="tripStyleId" value = "1">style1</div>
										<div class ="styleBlock"><input type ="checkbox" id ="element" name="tripStyleId" value = "2">style2</div>
										<div class ="styleBlock"><input type ="checkbox" id ="element" name="tripStyleId" value = "3">style3</div>						

										<div class ="cityBlock"><input type ="checkbox" id ="element" name="tripCityId" value = "3">부산</div>
										<div class ="cityBlock"><input type ="checkbox" id ="element" name="tripCityId" value = "3">서울</div>
										<div class ="cityBlock"><input type ="checkbox" id ="element" name="tripCityId" value = "3">제주</div> 
										
																				
										<input type ="submit" id = "selectedOptions" value ="선택"/>
									</form:form>	
									
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
