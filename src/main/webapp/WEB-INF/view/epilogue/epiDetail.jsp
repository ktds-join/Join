<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 상세 페이지</title>

</head>
<body>
	<!-- Whole Wrapper -->
	<div>
		<div>
			제목 : ${epilogue.epilogueTitle}
		</div>
		<div>
			<c:choose>
				<c:when test="${not empty epilogue.memberVO}">
					아이디(닉네임) : ${epilogue.memberVO.memberEmail}(${epilogue.memberVO.memberNickname})
				</c:when>
				<c:otherwise>
					<h3>탈퇴한 회원</h3>
				</c:otherwise>
			</c:choose>
		</div>
		<div>
			평점 : ${epilogue.epilogueGrade}
		</div>
		<div>
			내용 : ${epilogue.epilogueBody}
		</div>
		<div>
			<a href="<c:url value='/epiList'/>"><input type="button" id="goBackBtn" value="뒤로가기"/></a>
		</div>
	</div>
</body>
</html>