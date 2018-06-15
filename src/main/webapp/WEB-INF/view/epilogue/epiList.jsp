<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 페이지</title>

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
  
  <!-- All the files that are required -->
 <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css'>
 <style class="cp-pen-styles"></style>
 <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
 <link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
 <script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" type="text/javascript"></script>
 <script type="text/javascript" src="<c:url value="/static/js/bootstrap.min.js"/>"></script>
 <script type="text/javascript" src="<c:url value="/static/js/bootstrap.js"/>"></script>
 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
 <style>
   #container {
     width: 70%;
     margin: 0 auto;     /* 가로로 중앙에 배치 */
     padding-top: 10%;   /* 테두리와 내용 사이의 패딩 여백 */
   }
    
   #list {
     text-align: center;
   }
  
   #write {
     text-align: right;
   }
    
   /* Bootstrap 수정 */
   .table > thead {
     background-color: #18d26e;
   }
   .table > thead > tr > th {
     text-align: center;
   }
   .table-hover > tbody > tr:hover {
     background-color: #d2d2d2;
   }
   .table > tbody > tr > td {
     text-align: center;
   }
   .table > tbody > tr > #title {
     text-align: left;
   }
    
   div > #paging {
     text-align: center;
   }
    
   .hit {
     animation-name: blink;
     animation-duration: 1.5s;
     animation-timing-function: ease;
     animation-iteration-count: infinite;
     /* 위 속성들을 한 줄로 표기하기 */
     /* -webkit-animation: blink 1.5s ease infinite; */
   }
    
   /* 애니메이션 지점 설정하기 */
   /* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
   @keyframes blink {
     from {color: white;}
     30% {color: yellow;}
     to {color: red; font-weight: bold;}
     /* 0% {color:white;}
     30% {color: yellow;}
     100% {color:red; font-weight: bold;} */
   }
 </style>
<!-- 추가 -->	
<script type="text/javascript">
	$("#searchKeyword").keyup(function(event) {
		if (event.key == "Enter") {
			movePage('0');
		}
	});
</script>
</head>
<body>
	<br><br><br><br><!-- 나중에 수정해야됨.... -->
	<!-- header :: navbar 부분 -->
	<jsp:include page="/WEB-INF/view/template/navbar.jsp" />
	
	<div id="container">
		<div align="right">
			<div id="list" style="font-size: 11pt;">
				${epilogueList.size()}건의 게시글이 검색되었습니다.
			</div>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th width="10%">ID</th>
						<th width="50%">제목</th>
						<th width="10%">작성자</th>
						<th width="20%">작성일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${epilogueList}" var="epilogue">
					<tr>
						<td>${epilogue.epilogueId}</td>
						<td><a href="<c:url value="/epiDetail/${epilogue.epilogueId}"/>">${epilogue.epilogueTitle}</a>
							<c:if test="${not empty epiloguePictureVO.epiloguePictureName}">
								<img src="<c:url value="/static/img/file.png"/>" alt="${epilogue.epiloguePictureName}"  style="width:15px;"/>
							</c:if>
						</td>
						<td>
							<c:choose>
								<c:when test="${not empty epilogue.memberVO}">
									${epilogue.memberVO.memberNickname}
								</c:when>
								<c:otherwise>
									탈퇴한 회원
								</c:otherwise>
							</c:choose>
						</td>
						<td>${epilogue.epilogueWriteDate}</td>
					</tr>
					</c:forEach>
					<c:if test="${empty epilogueList}">
						<tr>
							<td colspan="4">등록된 게시글이 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<!--
			<form id="searchForm" onsubmit="movePage('0')">
				${pageExplorer.make()}
				<div id="list" style="font-size: 10pt;">
					<select id="searchType" name="searchType">
						<option value="1" ${search.searchType eq 1 ? 'selected' : ''}> 글 제목 </option>
						<option value="2" ${search.searchType eq 2 ? 'selected' : ''}> 글 내용 </option>
						<option value="3" ${search.searchType eq 3 ? 'selected' : ''}> 글 제목 + 글 내용</option>
					</select>
					<input type="text" id="searchKeyword" name="searchKeyword"
							value="${search.searchKeyword}" />
					<a href="<c:url value="/reset"/>" >검색 초기화</a>
				</div>
			</form>-->
			
			<div id="write">
				<a href="<c:url value="/epiWrite"/>">글쓰기</a>
			</div>
			
		</div>
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