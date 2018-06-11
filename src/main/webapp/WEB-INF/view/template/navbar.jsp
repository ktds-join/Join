<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#header {
  padding: 20px 0;
  height: 72px;
  position: fixed;
  background: rgba(0, 0, 0, 0.9);
  left: 0;
  top: 0;
  right: 0;
  transition: all 0.5s;
  z-index: 997;
  text-decoration:none;
}
</style>
 <!--==========================
    Header
  ============================-->
  <header id="header">
    <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="<c:url value="/main"/>" class="scrollto">JOIN</a></h1>
      </div>

      <nav id="nav-menu-container"> 
        <ul class="nav-menu">
          <li class="menu-active"><a href="<c:url value="/main"/>">Home</a></li>
          <c:if test="${empty sessionScope.__MEMBER__}">
          <li class="menu"><a href="<c:url value="/login"/>">Login</a></li>
          </c:if>
          <c:if test="${not empty sessionScope.__MEMBER__}">
				<li class="menu-has-children"><a href="<c:url value="/myPage"/>">Mypage</a>
					<ul>
						<li>
							<div id ="navMypage">
								<h4>My Info</h4>
								<!-- 일단 css 추가하려고 이미지 파일 올림 -->
								<p class ="profileImgPart">
								<img id = "profileImg" src="<c:url value ="/static/img/default.jpg"/>"/>
								</p>
								<p>${sessionScope.__MEMBER__.memberNickname}</p>
								<p>${sessionScope.__MEMBER__.memberEmail}</p>
										<!-- TODO : 여기에 프로필 사진 및 회원 정보 추가 -->
										<%-- <img id = "profileImg" src="<c:url value="/profile/${sessionScope.__MEMBER__.memberId}"/>"/> --%>
								<button type="button" id ="myPageBtn" class="btn btn-info btn-lg">myPage</button>	
							</div>
						</li>
					</ul>
				</li>
				<li class="menu"><a href="<c:url value="/logout"/>">Logout</a></li>
			</c:if>
          <li><a href="#">Epilogue</a></li>
          
        </ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->