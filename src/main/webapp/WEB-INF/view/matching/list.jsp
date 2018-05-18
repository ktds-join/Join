<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css"
		href="<c:url value="/static/css/main.css"/>" />
<link rel="stylesheet" type="text/css"
		href="<c:url value="/static/css/update.css"/>" />

<title>matchingList page</title>

</head>
<body>
	<div class="content">
		<div class="innerwrap">
			<div class="header" style="padding:50px 0 0 25px;"></div>
			<div class="course">
				<div class="listwrap">
					<p class="course" style="font-size:1.4em;font-weight:normal;padding:0 0 0 10px;" >
						Matching List 
						<%-- <span class="account">accounts : ${communityAccount}</span> --%>
						<a class="view_all" href="<c:url value="#"/>">전체보기</a>
					</p>
					<c:forEach items="${newCommunity}" var="newCommunity">
						<div class="box">
							<div class="card">
								<strong class="name">
									<a href="<c:url value="/read/${newCommunity.communityId}"/>">${newCommunity.title}</a>
								</strong>
								<div class="course_info">
									포함된 토픽 개수<strong> ${newCommunity.topicQuantity}</strong>
									<br/>봤어요<strong> ${newCommunity.viewCount}</strong>
									<br/>추천수<strong> ${newCommunity.recommendCount}</strong>
								</div>
							</div>
							<div class="name_card">
								<c:choose>
									<c:when test="${ not empty newCommunity.memberVO}">
										<span class="name">
											${newCommunity.memberVO.nickname}
										</span>
									</c:when>
									<c:otherwise>
										탈퇴한 회원
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</c:forEach>
					<div class="box gate">
						<div class="cover">+</div>
						<div class="sign">
							<strong>직접 코스를<br/>만들어 보세요</strong> 
							<a class="btnCreateCourse" href="<c:url value="/write"/>">코스 만들기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>