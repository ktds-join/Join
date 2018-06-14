<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매칭리스트 페이지</title>
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

<link rel="stylesheet" type="text/css"
		href="<c:url value="/static/css/list.css"/>" />


</head>

<body>
<br><br><br><!-- 나중에 수정해야됨.... -->
<!-- header :: navbar 부분 -->
	<jsp:include page="/WEB-INF/view/template/navbar.jsp" />
	<div class="content">
		<div class="innerwrap">
			<div class="course">
				<div class="listwrap">
					<p class="list_header">
						<span class="list_name">Matching List</span> 
						<%-- <span class="account">accounts : ${mateAccount}</span> --%>
						<a class="view_all" href="<c:url value="#"/>">전체보기</a>
					</p>
					<div class="boxwrap">
						<c:forEach items="${mateList}" var="mateList">
							<div class="box">
								<div class="card">
									<strong class="name">
										<a href="<c:url value="/mate/social/${mateList.mateId}"/>">${mateList.mateTitle}</a>
									</strong>
									<div class="course_info">
										여행 출발일!<strong> ${mateList.mateStartDate}</strong>
										<br/>여행 종료일!<strong> ${mateList.mateEndDate}</strong>
										<br/>현재인원/총인원<strong> /${mateList.mateCapacity}</strong>
										<br/>그룹성향1<strong> ${mateList.mateStyle1}/200</strong>
										<br/>그룹성향2<strong> ${mateList.mateStyle2}/200</strong>
										<br/>그룹성향3<strong> ${mateList.mateStyle3}/200</strong>
										<br/>그룹성향4<strong> ${mateList.mateStyle4}/200</strong>
										<br/>그룹성향5<strong> ${mateList.mateStyle5}/200</strong>
									</div>
								<!-- 수정중 -->
								<%-- <div class="name_card">
									<c:choose>
										<c:when test="${ not empty mateList.memberVO}">
											<span class="name">
												${mateList.memberVO.nickname}
											</span>
										</c:when>
										<c:otherwise>
											없어진 그룹
										</c:otherwise>
									</c:choose>
								</div> --%>
								</div>
							</div>
						</c:forEach>
						<div class="box gate">
							<div class="cover">+</div>
							<div class="sign">
								<strong>직접 그룹을<br/>만들어 보세요</strong> 
								<a class="btnCreateMate" href="<c:url value="/mate/write"/>">그룹 만들기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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