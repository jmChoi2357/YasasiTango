<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>Result</title>
<!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="<%=request.getContextPath()%>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath()%>/resources/css/landing-page.min.css" rel="stylesheet">
</head>
<body>

<!-- Navigation -->
  <nav class="navbar navbar-light bg-light static-top">
    <div class="container">
      <a class="navbar-brand" href="/">[優し単語]</a>
      
      <div id="top_login">
      <c:choose>
      	<c:when test="${not empty sessionScope.loginId }">
	    	<div class="btn"><b>${sessionScope.loginId }님 환영합니다!</b></div>
	    	&nbsp;&nbsp;
	    	<a class="btn btn-primary" href="/member/logout">Logout</a>
		</c:when>
		<c:otherwise>		
	      <a class="btn btn-primary" href="/loginPage">login</a>
	      &nbsp;&nbsp;
		  <a class="btn btn-primary" href="/member/joinForm">회원가입</a> 
		</c:otherwise>
      </c:choose>
      </div>
    </div>
  </nav>
  <div class="container">
  <br>
  <br>
    <h1>당신의 점수는 ${point }점 입니다!!</h1>
    <form action = "/quiz/goHome">
        <input type="submit" class="btn btn-primary" value="돌아가기">
    </form>  
  </div>
</body>
</html>