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
<title>QuizMain</title>
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
      <a class="navbar-brand" href="/">[優しい単語]</a>
      
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
<br>
<br>
<div class="container">

    <c:if test="${not empty sessionScope.loginId }">
    <h1>현재 ${sessionScope.loginId}님의 레벨은 N${level } 입니다!</h1>
    <button class="btn btn-primary" onclick="location.href='/quiz/quiz_level?level=${level }'">레벨업 퀴즈도전</button>
     &nbsp;&nbsp;
    </c:if>
    <button class="btn btn-primary" onclick="location.href='/quiz/quiz_random'">랜덤 퀴즈풀기</button>
    <br>
    <br>
    
    <h2> JLPT 등급별 퀴즈풀기 </h2>

	<form action="/quiz/quiz_level">
		<input type ="radio" name ="level" value="1"> JLPT1
	    <input type ="radio" name ="level" value="2"> JLPT2
		<input type ="radio" name ="level" value="3"> JLPT3
		<input type ="radio" name ="level" value="4"> JLPT4
		<input type ="radio" name ="level" value="5"> JLPT5 <br>
		<input type = "submit" class="btn btn-primary" value="등급별 퀴즈 풀기">
    </form>
</div>
</body>
</html>