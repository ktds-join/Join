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
}
</style>
 <!--==========================
    Header
  ============================-->
  <header id="header">
    <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="#intro" class="scrollto">JOIN</a></h1>
      </div>

      <nav id="nav-menu-container"> 
        <ul class="nav-menu">
          <li class="menu-active"><a href="#intro">Home</a></li>
          <c:if test="${empty sessionScope.__MEMBER__}">
          <li class="menu"><a href="/Join/login">Login</a></li>
          </c:if>
          <c:if test="${sessionScope.__MEMBER__}">
          <li class="menu-has-children"><a href="">Mypage</a>
            <ul>
              <li>
              <div style ="background-color:red;height:400px;width:180px"><a href="#">it gonna be DIV</a></div>
              </li> 
            </ul>
          </li>
          </c:if>
          <li><a href="/epi">Epilogue</a></li>
          
        </ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->