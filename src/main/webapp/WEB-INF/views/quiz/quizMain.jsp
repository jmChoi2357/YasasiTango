<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QuizMain</title>
</head>
<body>
    <h1>현재 ${sessionScope.loginId}님의 레벨은 N${level } 입니다!</h1>
    <button onclick="location.href='/quiz/quiz_level?level=${level }'">레벨업 퀴즈도전</button>
    <button onclick="location.href='/quiz/quiz_random'">랜덤 퀴즈풀기</button>
    <button onclick="location.href='/quiz/goHome'">돌아가기</button>
    
    <h2> JLPT 등급별 퀴즈풀기 </h2>

	<form action="/quiz/quiz_level">
		<input type ="radio" name ="level" value="1"> JLPT1
	    <input type ="radio" name ="level" value="2"> JLPT2
		<input type ="radio" name ="level" value="3"> JLPT3
		<input type ="radio" name ="level" value="4"> JLPT4
		<input type ="radio" name ="level" value="5"> JLPT5 <br>
		<input type = "submit" value="등급별 퀴즈 풀기">
    </form>
</body>
</html>