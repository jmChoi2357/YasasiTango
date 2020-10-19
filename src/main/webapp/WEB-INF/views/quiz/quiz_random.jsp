<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz Start</title>

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
    <h1>[${quiz.kanji }]</h1>
    <c:forEach var="question" items="${question }" varStatus="status">
        <button onclick="location.href='/quiz/answer?answer=${question.korean }'">${question.korean }</button> <br>
    </c:forEach>
    <div id="ViewTimer"></div>
</body>
</html>