<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 등록 페이지</title>

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
  
  <style>
    #contentForm {
      width: 65%;
      margin: 0 auto;
      padding-top: 1%;
    }
 
    .table > thead > tr > th, .table > tbody > tr > th {
      background-color: #18d26e;
      text-align: center;
    }
 </style>
 
 <style>
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('static/img/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>
 
<script type="text/javascript"
	src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
 <script type="text/javascript">
 	$().ready(function() {
 		$("#epiWriteBtn").click(function() {
 			$("#epilogueForm").attr({
 				"method" : "post",
		 		"action" : "<c:url value="/epiWrite"/>"	
 			}).submit();
 			
 		});
 	});
 
 </script>
 <body>
	<br><br><br><br><!-- 나중에 수정해야됨.... -->
	<!-- header :: navbar 부분 -->
	<jsp:include page="/WEB-INF/view/template/navbar.jsp" />
	 <form:form modelAttribute="epilogueForm" enctype="multipart/form-data">
		<div id="contentForm">
			<div class="input-group input-group-sm" role="group" aria-label="...">
			<div class="btn-group btn-group-sm" role="group" aria-label="..." >
				<a href="<c:url value="/epi"/>"><input class="btn btn-default" type="button" id="epiListBtn" value="뒤로"  /></a>
			</div>
			<div class="btn-group btn-group-sm" role="group" aria-label="..." style="margin-left: 89%;">
				<input class="btn btn-default" type="button" id="epiWriteBtn" value="등록"  />
			</div>
			<div style="margin-left:40%; margin-bottom:1%; ">
					<h5 style="margin-left:25%; margin-bottom:0;">나의 별점</h5>
					<span class="star-input">
						<span class="input">
					    	<input type="radio" name="epilogueGrade" value="1" id="p1">
					    	<label for="p1">1</label>
					    	<input type="radio" name="epilogueGrade" value="2" id="p2">
					    	<label for="p2">2</label>
					    	<input type="radio" name="epilogueGrade" value="3" id="p3">
					    	<label for="p3">3</label>
					    	<input type="radio" name="epilogueGrade" value="4" id="p4">
					    	<label for="p4">4</label>
					    	<input type="radio" name="epilogueGrade" value="5" id="p5">
					    	<label for="p5">5</label>
					  </span>
					  <output for="star-input"><b>0</b>점</output>						
				</span>
			</div>
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
					<th style="padding-top: 15px" style="text-align: center;">제목</th> 
						<td>
							<input type="text" id="epilogueTitle" name="epilogueTitle" value="${epilogue.epilogueTitle}"  class="form-control" aria-describedby="basic-addon1"/>
						</td>
					</tr>
				</thead>
				<div>
					<form:errors path="epilogueTitle" />
				</div>
				
				<tbody>
					<tr>
						<td colspan="2">
							<div>
								<textarea class="form-control" rows="20" cols="50" id="epilogueBody" name="epilogueBody" style="resize:none;">${epilogue.epilogueBody}</textarea>
							</div>
						</td>
					</tr>
				</tbody>
				
				<tr>
					<th>첨부파일</th>
					<td>
						<div>
							<input type="file" id="epilogue.epiloguePictureVO.epiFile" name="epilogue.epiloguePictureVO.epiFile" class="btn btn-default" />
						</div>
					</td>
				</tr>
			</table>
				</div>
				
				<div>
					<input type="hidden" id="mateId" name="mateId"
						value="${sessionScope.__COOKIE__.mateId}" />
				</div>
			
				<div>
					<form:errors path="epilogueWriteDate" />
				</div>
			
		</div>
	</form:form>

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
	  <!-- star.js -->
	  <script src="static/js/star.js"></script>
</body>
</html>