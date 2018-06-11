<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
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
  <link href="<c:url value="static/lib/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet">
  <link href="<c:url value="static/lib/animate/animate.min.css"/>" rel="stylesheet">
  <!-- Main Stylesheet File -->
  <link href="<c:url value="static/css/style.css"/>" rel="stylesheet">
<!-- 추가 -->	
<script type="text/javascript"
	src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function() {
		$("#loginBtn").click(function() {
			
			if ($("#email").val() == "") {
				$("#errorId").slideDown(300);
				$("#email").focus();
				return false;
			} else {
				$("#errorId").slideUp(300);
			}

			if ($("#password").val() == "") {
				$("#errorPassword").slideDown(300);
				$("#password").focus();
				return false;
			} else {
				$("#errorPassword").slideUp(300);
			}
			
			$("#loginForm").attr({
				"action" : "<c:url value = "/login"/>",
				"method" : "post"
			}).submit();
		});
	});
</script>
</head>
<body>
<br><br><br><br><!-- 나중에 수정해야됨.... -->
<!-- header :: navbar 부분 -->
	<jsp:include page="/WEB-INF/view/template/navbar.jsp" />
	
	<div id="whole_wrapper">
		<div id="cols">
			<div id="wrapper">
				<form:form modelAttribute="loginForm">
					<div class="header">
						<strong>로그인</strong>
						<p class="rememberme">
							<input type="checkbox" id="rememberme" name="maintainSession" value="true">
							<label for="rememberme">로그인 상태 유지</label>
						</p>
					</div>	
					<div class="body">
						<dl>
							<dt><label for="email">아이디 (이메일)</label></dt>
							<dd><input type="text" class="text" id="email" name="memberEmail"/></dd>
							<div id="errorId" style="display: none;">아이디를 입력하세요!</div>
							<dt><label for="password">비밀번호</label></dt>
							<dd><input type="password" class="text" id="password" name="memberPassword"/></dd>
							<div id="errorPassword" style="display: none;">비밀번호를 입력하세요!</div>
						</dl>
						<div class="btn">
							<p><button type="submit" id="loginBtn" class="btn_submit">로그인</button></p>
						</div>
					</div>
					<div class="footer">
						<a href="#">비밀번호 찾기</a>
						&nbsp; | &nbsp; 
						<a href="<c:url value="/regist"/>">회원가입</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>
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
</body>
</html>