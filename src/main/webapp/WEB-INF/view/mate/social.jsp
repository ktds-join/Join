<%@ page language="java" contentType="text/html;  set=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;  set=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript"
		src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
	<script type="text/javascript">
	
		$().ready(function() {
			
			//if()
			
		});
	
	</script>
</head>

<body>

	<c:if test="${ sessionScope.status == 'host' }">			
			<h1> 호스트 </h1>
	</c:if>
	<c:if test="${ sessionScope.status == 'guest' }">			
			<h1> 게스트 </h1>
	</c:if>

	<h1>${social.mateId}</h1>
	<h1>${social.mateTitle}</h1>
	<h1>${social.mateStartDate}</h1>
	<h1>${social.mateEndDate}</h1>
	<h1>${social.mateRegistDate}</h1>
	<h1>${social.mateCapacity}</h1>
	<h1>${social.mateLicense}</h1>
	<h1>${social.matePoint}</h1>
	<h1>${social.mateStyle1}</h1>
	<h1>${social.mateStyle2}</h1>
	<h1>${social.mateStyle3}</h1>
	<h1>${social.mateStyle4}</h1>
	<h1>${social.mateStyle5}</h1>
	<h1>${social.tripCityId}</h1>
	<h1>${social.tripCityVO}</h1>
	<h1>${social.mateHostId}</h1>

</body>
</html>