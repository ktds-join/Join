<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function() {
		$("#writeBtn").click(function() {
			
			if( $("#mateTitle").val() != "" && $("#mateTitle").val() != null ) {
				$("#writeForm").attr({
					"method" : "post",
					"action" : "<c:url value="/mate/write"/>"
				}).submit();				
			}
			else {
				alert("모두 작성해주세요");
			}
			
		});
	});
</script>
<jsp:useBean id="nowDate" class="java.util.Date" />
</head>
<body>
	<div>
		<form id="writeForm">
			<div>
				<div>${member.memberNickname} 님의 새로운 그룹의 이름을 정해주세요</div>
				<input type="text" id="mateTitle" name="mateTitle" />
			</div>
			<div>
				<div>그룹의 여행 시작일을 정해주세요</div>
				<input type="date" id="mateStartDate" name="mateStartDate" 
					   value="<fmt:formatDate value="${nowDate}" pattern="yyyy-MM-dd" />" />
				<div>그룹의 여행 종료일을 정해주세요</div>
				<input type="date" id="mateEndDate" name="mateEndDate" value="2018-12-31"/>
			</div>
			<div>
				<div>그룹의 max인원을 정해주세요 (본인포함)</div>
				<input type="number" id="mateCapacity" name="mateCapacity"
					   value="2" step="1" min="2" max="6" />
			</div>
			<div>
				<div>${member.memberNickname} 님은 면허를 갖고 계신가요</div>
				<input type="radio" id="mateLicense" name="mateLicense" value="y" checked="checked"> 있음
				<input type="radio" id="mateLicense" name="mateLicense" value="n"> 없음				
			</div>
			<div>
				<div>그룹의 목적지를 선택해 주세요</div>
				<input type="radio" id="tripCityId" name="tripCityId" value="1" checked="checked"> 서울
				<input type="radio" id="tripCityId" name="tripCityId" value="2"> 부산
				<input type="radio" id="tripCityId" name="tripCityId" value="3"> 제주
			</div>
			<div>
				<div>${member.memberNickname} 님이 선택하신 성향은 아래와 같습니다 그룹을 만들기전 성향을 바꾸고 싶으면 바꾸던가 시발</div>
				<div>휴양지<input type="range" id="mateStyle1" name="mateStyle1" min="0" max="200" step="50" value="${member.memberStyle1}" />도심지</div>
				<div>레져<input type="range" id="mateStyle2" name="mateStyle2" min="0" max="200" step="50" value="${member.memberStyle2}" />랜드마크</div>
				<div>아침형<input type="range" id="mateStyle3" name="mateStyle3" min="0" max="200" step="50" value="${member.memberStyle3}" />야행성</div>
				<div>저렴함<input type="range" id="mateStyle4" name="mateStyle4" min="0" max="200" step="50" value="${member.memberStyle4}" />부유함</div>
				<div>먹방<input type="range" id="mateStyle5" name="mateStyle5" min="0" max="200" step="50" value="${member.memberStyle5}" />탐방</div>
			</div>
		</form>
		<input type="button" id="writeBtn" value="글쓰기" />
	</div>
</body>
</html>