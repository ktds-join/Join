<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function(){
		$("#moveLoginBtn").click(function(){
			location.href = "<c:url value="/login"/>";
		});
	});
</script>
</head>
<body>
	계정이 삭제되었습니다.
	<div id="moveLoginBtn" class="button">로그인 페이지로 이동</div>
</body>
</html>