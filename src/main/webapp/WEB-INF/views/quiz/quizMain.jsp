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
    <button onclick="location.href='/quiz/quiz_level?level=${level }'">레벨별 퀴즈풀기</button>
    <button onclick="location.href='/quiz/quiz_random'">랜덤 퀴즈풀기</button>
    <button onclick="location.href='/quiz/goHome'">돌아가기</button>
</body>
</html>