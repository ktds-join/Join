<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css"
		href="<c:url value="/static/css/list.css"/>" />

<title>matchingList page</title>

</head>

<body>
	<div class="content">
		<div class="innerwrap">
			<div class="course">
				<div class="listwrap">
					<p class="list_header">
						<span class="list_name">Matching List</span> 
						<%-- <span class="account">accounts : ${mateAccount}</span> --%>
						<a class="view_all" href="<c:url value="#"/>">전체보기</a>
					</p>
<<<<<<< HEAD
					<div class="boxwrap">
						<c:forEach items="${mateList}" var="mateList">
							<div class="box">
								<div class="card">
									<strong class="name">
										<a href="<c:url value="#"/>">${mateList.mateTitle}</a>
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
=======
					<c:forEach items="${mateList}" var="mateList">
						<div class="box">
							<div class="card">
								<strong class="name">
									<a href="<c:url value="/mate/social/${mateList.mateId}"/>">${mateList.mateTitle}</a>
								</strong>
								<div class="course_info">
									여행 출발일!<strong> ${mateList.mateStartDate}</strong>
									<br/>여행 종료일!<strong> ${mateList.mateEndDate}</strong>
									<br/>총인원<strong> ${mateList.mateCapacity}</strong>
									<br/>그룹성향1<strong> ${mateList.mateStyle1}/200</strong>
									<br/>그룹성향2<strong> ${mateList.mateStyle2}/200</strong>
									<br/>그룹성향3<strong> ${mateList.mateStyle3}/200</strong>
									<br/>그룹성향4<strong> ${mateList.mateStyle4}/200</strong>
									<br/>그룹성향5<strong> ${mateList.mateStyle5}/200</strong>
>>>>>>> 82367749dde5d9d8316fea64c3586bb2665e9f09
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
</body>
</html>