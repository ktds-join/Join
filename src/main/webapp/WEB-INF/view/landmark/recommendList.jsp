<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행지 추천 페이지</title>
</head>
<body>
리스트 보여주기
<hr>
<%-- <a href="<c:url value="/recommend"/>">전체</a> --%>
<c:forEach items="${landmarkList}" var="list">
<p>${list.landmarkTitle }</p>
</c:forEach>
<%-- <hr>
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
</c:forEach> --%>

<!-- 컨트롤러에서 받아오기 -->
<c:forEach var = "styleList" items="${selectList.tripStyleId}">
${styleList }
</c:forEach>

<!-- 여행 스타일 선택 div -->
<div id = "tripStyle" class="carousel-content">
		<!-- 선택 폼 -->
		<form:form id="tripStyleForm">
			<div class ="styleBlock"><input type ="checkbox" id ="allElements" name="tripStyleAll" value = "0">all</div>
			<div class ="styleBlock"><input type ="checkbox" id ="element" name="tripStyleId" value = "1">style1</div>
			<div class ="styleBlock"><input type ="checkbox" id ="element" name="tripStyleId" value = "2">style2</div>
			<div class ="styleBlock"><input type ="checkbox" id ="element" name="tripStyleId" value = "3">style3</div>						

			<div class ="cityBlock"><input type ="checkbox" id ="element" name="tripCityId" value = "1">서울</div>
			<div class ="cityBlock"><input type ="checkbox" id ="element" name="tripCityId" value = "2">부산</div>
			<div class ="cityBlock"><input type ="checkbox" id ="element" name="tripCityId" value = "3">제주</div>
			
													
			<input type ="submit" id = "selectedOptions" value ="선택"/>
		</form:form>	
		<!--  -->
</div>

</body>
</html>