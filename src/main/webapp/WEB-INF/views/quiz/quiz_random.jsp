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
<title>Quiz Start</title>
<!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="<%=request.getContextPath()%>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath()%>/resources/css/landing-page.min.css" rel="stylesheet">

<script>
		var SetTime = 5;		// 최초 설정 시간(기본 : 초)

		function msg_time() {	// 1초씩 카운트
			m = (SetTime % 60) + "초";	// 남은 시간 계산
			var msg = "남은 시간: <font color='red'>" + m + "</font>";
			document.all.ViewTimer.innerHTML = msg;		// div 영역에 보여줌 		
			SetTime--;					// 1초씩 감소
			if (SetTime < 0) {			// 시간이 종료 되었으면..
				clearInterval(tid);		// 타이머 해제
				location.href = "/quiz/answer?answer=null";
			}
		}
		window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };
	</script>

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
  <br><br>
  <div class="container">
  
    <h1>[${quiz.kanji }]</h1>
    <c:forEach var="question" items="${question }" varStatus="status">
    <br>
        <button class="btn btn-primary" onclick="location.href='/quiz/answer?answer=${question.korean }'">${question.korean }</button> 
       <br>
        
        
    </c:forEach>
    <div id="ViewTimer"></div>
  </div>
</body>
</html>