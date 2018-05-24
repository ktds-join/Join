<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행지 추천 페이지</title>
</head>
<body>
리스트 보여주기
<hr>
<a href="<c:url value="/recommend/all"/>">전체</a>
<c:forEach items="${landmarkList}" var="list">
<p>${list.landmarkTitle }</p>
</c:forEach>
<hr>
<div>
<a href="<c:url value="/recommend/city/1"/>">서울</a>
<a href="<c:url value="/recommend/city/2"/>">부산</a>
<a href="<c:url value="/recommend/city/3"/>">제주</a>						
</div>

<c:forEach items="${cityLM}" var="landmark">
<p>${landmark.landmarkImageName }</p>
</c:forEach>

<hr>

<div>
<a href="<c:url value="/recommend/style/1"/>">스타일1</a>
<a href="<c:url value="/recommend/style/2"/>">스타일2</a>
<a href="<c:url value="/recommend/style/3"/>">스타일3</a>						
</div>

<c:forEach items="${styleLM}" var="landmark">
<p>${landmark.landmarkImageName }</p>
</c:forEach>
</body>
</html>