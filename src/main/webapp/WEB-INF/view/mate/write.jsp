<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매칭방 만들기</title>
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

<script type="text/javascript"
   src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
   $().ready(function() {
      
      $("#writeBtn").click(function() {
         
         $.post("<c:url value="/api/exists/mate"/>", {}
         , function(response) {
               if ( response.response ) {
                  
                  // 할 작업.
                  if( $("#mateTitle").val() != "" && $("#mateTitle").val() != null ) {
                     $("#writeForm").attr({
                        "method" : "post",
                        "action" : "<c:url value="/mate/write"/>"
                     }).submit();            
                  }
                  else {
                     alert("모두 작성해주세요");
                  }
               } else {
                  
                  alert("회원님께서 이미 개설하신 방이 있습니다.");
               }
         });
      });
   });
</script>
<jsp:useBean id="nowDate" class="java.util.Date" />
</head>
<body>
   <br><br><br><!-- 나중에 수정해야됨.... -->
   <jsp:include page="/WEB-INF/view/template/navbar.jsp" />
	<div class="col-md-2" style="display:inline-block;vertical-align:top"></div>
	<div class="col-md-3" style="display:inline-block;vertical-align:top;padding-top:80px"><h2>그룹 만들기</h2></div>
      <div class="col-md-5" style="display:inline-block;vertical-align:top">
      <form id="writeForm" style ="width:450px;margin:auto;padding-top:80px">    
         <div>
            <div>${member.memberNickname} 님의 새로운 그룹의 이름을 정해주세요</div>
            <input type="text" id="mateTitle" class="form-control" name="mateTitle" />
         </div>
         <div>
            <div>그룹의 여행 시작일을 정해주세요</div>
            <input type="date" id="mateStartDate" class="form-control" name="mateStartDate" 
                  value='<fmt:formatDate value="${nowDate}" pattern="yyyy-MM-dd" />' />
            <div>그룹의 여행 종료일을 정해주세요</div>
            <input type="date" id="mateEndDate" class="form-control" name="mateEndDate" value="2018-12-31"/>
         </div>
         <div>
            <div>그룹의 max인원을 정해주세요 (본인포함)</div>
            <input type="number" id="mateCapacity" class="form-control" name="mateCapacity"
                  value="2" step="1" min="2" max="6" />
         </div>
         <div>
            <div>${member.memberNickname} 님은 면허를 갖고 계신가요</div>
            <div class="form-control"><input type="radio" id="mateLicense" name="mateLicense" value="y" checked="checked"> 있음
            <input type="radio" id="mateLicense" name="mateLicense" value="n"> 없음      </div>      
         </div>
         <div>
            <div>그룹의 목적지를 선택해 주세요</div>
            <div class="form-control"><input type="radio" id="tripCityId" name="tripCityId" value="1" checked="checked"> 서울
            <input type="radio" id="tripCityId" name="tripCityId" value="2"> 부산
            <input type="radio" id="tripCityId" name="tripCityId" value="3"> 제주</div>
         </div>
         <div>
            <div>${member.memberNickname} 님이 선택하신 성향은 아래와 같습니다.<br>그룹을 만들기전 성향을 바꾸고 싶으면 바꾸세요.</div>
            <div class="form-control"><div>휴양지<input type="range" id="mateStyle1" name="mateStyle1" min="0" max="200" step="50" value="${member.memberStyle1}" />도심지</div>
            <div>레져<input type="range" id="mateStyle2" name="mateStyle2" min="0" max="200" step="50" value="${member.memberStyle2}" />랜드마크</div>
            <div>아침형<input type="range" id="mateStyle3" name="mateStyle3" min="0" max="200" step="50" value="${member.memberStyle3}" />야행성</div>
            <div>저렴함<input type="range" id="mateStyle4" name="mateStyle4" min="0" max="200" step="50" value="${member.memberStyle4}" />부유함</div>
            <div>먹방<input type="range" id="mateStyle5" name="mateStyle5" min="0" max="200" step="50" value="${member.memberStyle5}" />탐방</div></div>
         </div>
         <input type="button" style="float:right;margin-top:10px" id="writeBtn" value="글쓰기" />
      </form>
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