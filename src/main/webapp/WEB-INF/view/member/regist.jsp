<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
		href="<c:url value="/static/css/member/regist.css"/>" />
<title>regist page</title>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function() {
		console.log($("#email").val()=="");
		$("#email").keyup(function() {
			var value = $(this).val();
			if (value != "") {
				$.post("<c:url value="/api/exists/email" />", {
					email : value
				}, function(response) {
					console.log(response.response);
					if (response.response) {
						$("#email").removeClass("valid");
						$("#email").addClass("invalid");
					} else {
						$("#email").removeClass("invalid");
						$("#email").addClass("valid");
					}
				});
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			} else {
				$(this).removeClass("valid");
				$(this).addClass("invalid");
			}
		});

		$("#nickname").keyup(function() {
			var value = $(this).val();
			if (value != "") {
				$.post("<c:url value="/api/exists/nickname" />", {
					nickname : value
				}, function(response) {
					console.log(response.response)

					if (response.response) {
						$("#nickname").removeClass("valid");
						$("#nickname").addClass("invalid");
					} else {
						$("#nickname").removeClass("invalid");
						$("#nickname").addClass("valid");
					}
				});
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			} else {
				$(this).removeClass("valid");
				$(this).addClass("invalid");
			}
		});

		$("#password").keyup(function() {
			var value = $(this).val();
			if (value != "") {

				$(this).removeClass("invalid");
				$(this).addClass("valid");

			} else {

				$(this).removeClass("valid");
				$(this).addClass("invalid");
			}

			var password = $("#password-confirm").val();

			if (value != password) {
				$(this).removeClass("valid");
				$(this).addClass("invalid");
				$("#password-confirm").removeClass("valid");
				$("#password-confirm").addClass("invalid");
			} else {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
				$("#password-confirm").removeClass("invalid");
				$("#password-confirm").addClass("valid");
			}
		});

		$("#password-confirm").keyup(function() {
			var value = $(this).val();
			var password = $("#password").val();

			if (value != password) {
				$(this).removeClass("valid");
				$(this).addClass("invalid");
				$("#password").removeClass("valid");
				$("#password").addClass("invalid");
			} else {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
				$("#password").removeClass("invalid");
				$("#password").addClass("valid");

			}
		})

		$("#registBtn").click(function() {

			if ($("#email").val() == "") {
				alert("email을 입력하세요");
				$("#email").focus();
				$("#email").addClass("invalid");
				return false;
			}

			if ($("#email").hasClass("invalid")) {
				alert("작성한 이메일은 사용할수 없습니다.");
				$("#email").focus();
				return false;
			}

			else {

				$.post("<c:url value="/api/exists/email"/>", { email : $("#email").val() }, function(response) {

					if (response.response) {
						alert("작성한 이메일은 사용할수 없습니다.");
						$("#email").removeClass("valid");
						$("#email").addClass("invalid");
						$("#email").focus();
						return false;
					}

					if ($("#nickname").val() == "") {
						alert("nickname을 입력하세요");
						$("#nickname").focus();
						$("#nickname").addClass("invalid");
						return false;
					}

					if ($("#password").val() == "") {
						alert("password을 입력하세요");
						$("#password").focus();
						$("#password").addClass("invalid");
						return false;
					}

					$("#registForm").attr({
						"method" : "post",
						"action" : "<c:url value="/regist"/>"
					}).submit();

				});

			}

		});
	});
</script>
</head>
<body>
	<div id="whole_wrapper">
		<div class="head">
			<header>
				<hgroup>
					<p class="title"><a href="">회원가입</a></p>
				</hgroup>
				<ul id="left_nav">
					<li id="to_home">
						<a class="title" href="<c:url value="/main"/>">
							<span>Open</span>tutorials.org
						</a>
					</li> 
				</ul>			
			</header>
		</div>
		<div id="cols">
			<div id="wrapper">		
				<form id="registForm">
					<div class="header">
						<strong>회원가입</strong>
					</div>
					<div class="body">
						<dl>
							<dt><label for="email">아이디 (이메일)</label></dt>
							<dd><input type="text" class="text" id="email" name="email" /></dd>
							<dt><label for="nickname">닉네임</label></dt>
							<dd><input type="text" class="text" id="nickname" name="nickname" /></dd>
							<dt><label for="password">비밀번호</label></dt>
							<dd><input type="password" class="text" id="password" name="password"/></dd>
							<dt><label for="password_confirm">비밀번호 확인</label></dt>
							<dd><input type="password" class="text" id="password-confirm" name="password-confirm"/></dd>
						</dl>
						<div class="btn">
							<p><button type="submit" id="registBtn" class="btn_submit">회원가입</button></p>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>