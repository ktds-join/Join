<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


</style>
</head>
<body>
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