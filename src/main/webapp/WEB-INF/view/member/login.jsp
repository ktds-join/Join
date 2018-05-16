<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
		href="<c:url value="/static/css/member/login.css"/>" />
<title>login page</title>
<script type="text/javascript"
	src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function() {
		$("#loginBtn").click(function() {
			
			if ($("#email").val() == "") {
				$("#errorId").slideDown(300);
				$("#email").focus();
				return false;
			} else {
				$("#errorId").slideUp(300);
			}

			if ($("#password").val() == "") {
				$("#errorPassword").slideDown(300);
				$("#password").focus();
				return false;
			} else {
				$("#errorPassword").slideUp(300);
			}
			
			$("#loginForm").attr({
				"action" : "<c:url value = "/login"/>",
				"method" : "post"
			}).submit();
		});
	});
</script>
</head>
<body>
	<div id="whole_wrapper">
		<div class="head">
			<header>
				<hgroup>
					<p class="title"><a href="">로그인</a></p>
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
				<form:form modelAttribute="loginForm">
					<div class="header">
						<strong>로그인</strong>
						<p class="rememberme">
							<input type="checkbox" id="rememberme" name="maintainSession" value="true">
							<label for="rememberme">로그인 상태 유지</label>
						</p>
					</div>	
					<div class="body">
						<dl>
							<dt><label for="email">아이디 (이메일)</label></dt>
							<dd><input type="text" class="text" id="email" name="memberEmail"/></dd>
							<div id="errorId" style="display: none;">아이디를 입력하세요!</div>
							<dt><label for="password">비밀번호</label></dt>
							<dd><input type="password" class="text" id="password" name="memberPassword"/></dd>
							<div id="errorPassword" style="display: none;">비밀번호를 입력하세요!</div>
						</dl>
						<div class="btn">
							<p><button type="submit" id="loginBtn" class="btn_submit">로그인</button></p>
						</div>
					</div>
					<div class="footer">
						<a href="#">비밀번호 찾기</a>
						&nbsp | &nbsp 
						<a href="<c:url value="/regist"/>">회원가입</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>