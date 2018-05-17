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
</body>
</html>

  </script>
</body>
</html>
