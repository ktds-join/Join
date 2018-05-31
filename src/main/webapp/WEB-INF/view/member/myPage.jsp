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
		
		$("#upload").click(function() {
			$("#memberProfile").click();
		});
		
		$("#modifyBtn").click(function() {
			if ( $("#memberNickname").val() == "" ) {
				alert("닉네임을 입력해 주세요.");
				$("#memberNickname").focus();
				return false;
			}
			$.post("<c:url value="/api/exists/memberNickname"/>", {
				memberNickname : $("#memberNickname").val()
			}, function(response) {
				if ( response.response ) {
					alert("이 닉네임은 사용할 수 없습니다.");
					$("#memberNickname").focus();
					return false;
				}
				else {
					$("#modifyForm").attr({
						"method" : "post",
						"action" : "<c:url value="/modify"/>"
					}).submit();
				}
			});
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
				<form:form modelAttribute="modifyForm" enctype="multipart/form-data">
					<div class="header">
						<strong>회원 정보 수정</strong>
					</div>
					<div class="body">
						<dl>
							<dt><label for="memberProfile">프로필 사진</label></dt>
							<dd class ="profileImgPart">
								<!-- <img id="profileImg" src="<c:url value ="/static/img/default.jpg"/>"/> -->
								<img id="profileImg" src="<c:url value="/profile/${sessionScope.__MEMBER__.memberId}"/>" width="146px" height="146px"/>
								<div class="btn">
									<input type="button" class="btn_submit" id="upload" value="파일 업로드"/>
									<input type="file" id="memberProfile" name="memberProfile" style="opacity:0;"/>
								</div>
							</dd>
							
							<dt><label for="memberEmail">아이디 (이메일)</label></dt>
							<dd>
								${sessionScope.__MEMBER__.memberEmail}
							</dd>
							
							<dt><label for="memberName">이름</label></dt>
							<dd>
								${sessionScope.__MEMBER__.memberName}
							</dd>
									   
							<dt><label for="memberNickname">닉네임</label></dt>
							<dd>
								<input type="text" class="text" id="memberNickname" name="memberNickname"
									   value="${sessionScope.__MEMBER__.memberNickname}"/>
								<form:errors id="memberNickname"/>
							</dd>
									   
							<dt><label for="memberSex">성별</label></dt>
							<dd>
								<c:choose>
									<c:when test="${sessionScope.__MEMBER__.memberSex eq 'M'}">
										남
									</c:when>
									<c:otherwise>
										여
									</c:otherwise>
								</c:choose>
							</dd>
						</dl>
						<div class="btn">
							<p><button type="button" id="modifyBtn" class="btn_submit">수정</button></p>
						</div>
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