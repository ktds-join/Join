<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 페이지</title>
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
<!-- 추가 -->	
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function() {
		
		/* 이메일 정규 표현식 */
		function email_check( email ) {    
		    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		    return (email != '' && email != 'undefined' && regex.test(email)); 
		}
		
		$("#memberEmail").blur(function(){
			var value = $(this).val();
			if(value == '' || value == 'undefined')
				return;
			if(!email_check(value)){
				$("#email-check").text('');
				$("#email-check").html('이메일 형식이 아닙니다.');
				$(this).focus();
				return false;
			}
			else{
				$("#email-check").text('');
			}
			
			if($("#memberEmail").hasClass("invalid")){
				$("#email-check").text('');
				$("#email-check").html('작성한 이메일은 사용할 수 없습니다.');
				
				$("#email").focus();
				return false;
			}
			else{
				$.post("<c:url value="/api/exists/memberEmail"/>", {
					memberEmail : $("#memberEmail").val()
				}, function(response) {

				if ( response.response ) {
					alert("작성한 이메일은 사용할 수 없습니다.")
					$("#email").focus();
					return false;
				}
				});
			}
		});
		
		$("#memberPassword").keyup(function() {
			var value = $(this).val();
			if ( value != "" ) {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			} else {
				$(this).removeClass("valid");
				$(this).addClass("invalid");
			}

			var password = $("#passwordConfirm").val();

			if ( value != password ) {
				$(this).removeClass("valid");
				$(this).addClass("invalid");
				$("#passwordConfirm").removeClass("valid");
				$("#passwordConfirm").addClass("invalid");
			} else {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
				$("#passwordConfirm").removeClass("invalid");
				$("#passwordConfirm").addClass("valid");
			}
		});

		$("#passwordConfirm").keyup(function() {
			var value = $(this).val();
			var password = $("#memberPassword").val();

			if ( value != password ) {
				$(this).removeClass("valid");
				$(this).addClass("invalid");
				$("#memberPassword").removeClass("valid");
				$("#memberPassword").addClass("invalid");
				$("#pwdChk").text('');
				$("#pwdChk").html('비밀번호가 다릅니다.');
			} else {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
				$("#memberPassword").removeClass("invalid");
				$("#memberPassword").addClass("valid");
				$("#pwdChk").text('');

			}
		});
		
		$("#memberName").keyup(function() {
			var value = $(this).val();
			if ( value != "" ) {
				$("#memberName").removeClass("invalid");
				$("#memberName").addClass("valid");
			} else {
				$("#memberName").removeClass("valid");
				$("#memberName").addClass("invalid");
			}
		});
		
		$("#memberNickname").keyup(function() {
			var value = $(this).val();
			if ( value != "" ) {
				$.post("<c:url value="/api/exists/memberNickname"/>", {
					memberNickname : value
				}, function(response) {
					if ( response.response ) {
						$("#memberNickname").removeClass("valid");
						$("#memberNickname").addClass("invalid");
					} else {
						$("#memberNickname").removeClass("invalid");
						$("#memberNickname").addClass("valid");
					}
				});
			} else {
				$(this).removeClass("valid");
				$(this).addClass("invalid");
			}
			
			if($("#memberNickname").hasClass("invalid")){
				$("#nick-check").text('');
				$("#nick-check").html('작성한 닉네임은 사용할 수 없습니다.');
				
				$("#memberNickname").focus();
				return false;
			}
			else{
				$.post("<c:url value="/api/exists/memberNickname"/>", {
					memberNickname : $("#memberNickname").val()
				}, function(response) {
					if( response.response ) {
						alert("작성한 닉네임은 사용할수 없습니다.")
						$("#memberNickname").removeClass("valid");
						$("#memberNickname").addClass("invalid");
						$("#memberNickname").focus();
						return false;
					}
				});
			}
			
		});

		$("#registBtn").click(function() {
			
			if ( $("#memberEmail").val() == "" ) {
				alert("이메일을 입력하세요");
				$("#memberEmail").focus();
				$("#memberEmail").addClass("invalid");
				return false;
			}


			if ( $("#memberPassword").val() == "" ) {
				alert("비밀번호를 입력하세요");
				$("#memberPassword").focus();
				$("#memberPassword").addClass("invalid");
				return false;
			}
		
			if ( $("#passwordConfirm").val() == "" ) {
				alert("비밀번호 확인을 입력하세요");
				$("#memberPassword").focus();
				$("#memberPassword").addClass("invalid");
				return false;
			}
		
			if ( $("#memberName").val() == "" ) {
				alert("이름을 입력하세요");
				$("#memberName").focus();
				$("#memberName").addClass("invalid");
				return false;
			}
			
			if ( $("#memberNickname").val() == "" ) {
				alert("닉네임을 입력하세요");
				$("#memberNickname").focus();
				$("#memberNickname").addClass("invalid");
				return false;
			}
		
			if ( $("#memberNickname").hasClass("invalid") ) {
				alert("작성한 닉네임은 사용할 수 없습니다.");
				$("#memberNickname").focus();
				return false;
			}
			$("#registForm").attr({
				"method" : "post",
				"action" : "<c:url value="/regist"/>"
			}).submit();
		});
	
	});
</script>
</head>
<body>

<!-- header :: navbar 부분 -->
	<jsp:include page="/WEB-INF/view/template/navbar.jsp" />
	<br><br><br><br><!-- 나중에 수정해야됨.... -->
	<div id="whole_wrapper">
		<div id="cols">
			<div id="wrapper">		
				<form:form modelAttribute="registForm" enctype="multipart/form-data">
					<div class="header">
						<strong>회원가입</strong>
					</div>
					<div class="body">
						<dl>
							<dt><label for="memberEmail">아이디 (이메일)</label></dt>
							<dd>
								<input type="text" class="text" id="memberEmail" name="memberEmail"
									   value="${registForm.memberEmail}"/>
								<form:errors id="memberEmail"/>
								<div id="email-check" style="float:left;color:red"></div>
							</dd>
									   
							<dt><label for="memberPassword">비밀번호</label></dt>
							<dd>
								<input type="password" class="text" id="memberPassword" name="memberPassword"
									   value="${registForm.memberPassword}"/>
								<form:errors id="memberPassword"/>
							</dd>
							
							<dt><label for="passwordConfirm">비밀번호 확인</label></dt>
							<dd><input type="password" class="text" id="passwordConfirm" name="passwordConfirm"/>
							<div id ="pwdChk" style="float:left;color:red"></div>
							</dd>
							
							<dt><label for="memberName">이름</label></dt>
							<dd>
								<input type="text" class="text" id="memberName" name="memberName"
									   value="${registForm.memberName}"/>
								<form:errors id="memberName"/>
							</dd>
									   
							<dt><label for="memberNickname">닉네임</label></dt>
							<dd>
								<input type="text" class="text" id="memberNickname" name="memberNickname"
									   value="${registForm.memberNickname}"/>
								<form:errors id="memberNickname"/>
							</dd>
									   
							<dt><label for="memberSex">성별</label></dt>
							<dd>
								<input type="radio" id="memberSexM" name="memberSex" value="M" checked="checked">남
								<input type="radio" id="memberSexF" name="memberSex" value="F">여
							</dd>
							<dd style="display:none;"><input type="file" id="memberProfile" name="memberProfile"/></dd>
						</dl>
						<div class="btn">
							<p><button type="button" id="registBtn" class="btn_submit">회원가입</button></p>
						</div>
					</div>
				</form:form>
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