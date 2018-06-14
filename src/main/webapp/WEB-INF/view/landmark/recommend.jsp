<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행지 추천 페이지</title>
<link rel="stylesheet" type="text/css"
		href="<c:url value="/static/css/member.css"/>" />
<!-- 추가 -->
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
    <link href="<c:url value="static/lib/ionicons/css/ionicons.min.css"/>" rel="stylesheet">
  <link href="<c:url value="static/lib/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet">
  <link href="<c:url value="static/lib/animate/animate.min.css"/>" rel="stylesheet">
  <!-- Main Stylesheet File -->
  <link href="<c:url value="static/css/style.css"/>" rel="stylesheet">
<!-- 추가 -->	
<script type="text/javascript"
	src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
$().ready(function(){
	$("input[na
		me=tripId]:checked").each(function(){
		var test = $(this).val();
		alert("Dd : "+test);
	});
});
</script>
</head>
<body>
<br><br><br><!-- 나중에 수정해야됨.... -->
	<!-- header :: navbar 부분 -->
	<jsp:include page="/WEB-INF/view/template/navbar.jsp" />
		<br><br><br>
	<!-- 여행 스타일 선택 div -->
	
		<!-- 선택 폼 -->
		<form:form id="tripStyleForm">
			<input type ="checkbox" id ="allElements" name="tripId" value = "0">all
			<input type ="checkbox" id ="element" name="tripId" value = "1">style1
			<input type ="checkbox" id ="element" name="tripId" value = "2">style2
			<input type ="checkbox" id ="element" name="tripId" value = "3">style3						

			<input type ="checkbox" id ="element" name="tripId" value = "1">서울
			<input type ="checkbox" id ="element" name="tripId" value = "2">부산
			<input type ="checkbox" id ="element" name="tripId" value = "3">제주
			
													
			<input type ="submit" id = "selectedOptions" value ="선택"/>
		</form:form>		
	
	<hr>
	
	<c:forEach items="${landmarkList}" var="list">
	<p>${list.landmarkTitle }</p>
	</c:forEach>
	<br><br><br><br>
	<!-- footer -->
	<jsp:include page="/WEB-INF/view/template/footer.jsp" />
	  <!-- JavaScript Libraries -->
	  <script src="<c:url value="static/lib/jquery/jquery.min.js"/>"></script>
	  <script src="<c:url value="static/lib/easing/easing.min.js"/>"></script><!-- go to top  -->
	  <script src="<c:url value="static/lib/superfish/superfish.min.js"/>"></script><!-- dropdown pointer -->
	  <script src="<c:url value="static/lib/wow/wow.min.js"/>"></script><!-- 메인 글자 가운데 정렬   -->
	  <script src="<c:url value="static/js/main.js"/>"></script>
</body>
</html>