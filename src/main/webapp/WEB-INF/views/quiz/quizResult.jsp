<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
</head>
<body>
    <h1>당신의 점수는 ${point }점 입니다!!</h1>
    <form action = "/quiz/goHome">
        <input type="submit" value="돌아가기">
    </form>
</body>
</html>