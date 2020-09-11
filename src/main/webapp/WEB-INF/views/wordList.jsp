<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>wordList</title>
</head>
<body>
	<form>
		<input type="text" disabled="disabled">
		<select>
			<option>날짜선택</option>
			<option>레벨선택</option>
			<option>품사선택</option>
		</select>
		
		<input type="button" value="검색">
	</form>
	
	<br>
	<table>
		<tr>
			<th>날짜</th>
			<td>급수 단어(히라가나) 단어[한자] 음성듣기 아이콘</td>
		</tr>
		<tr>
			<td>colSpan(listSize)이 먹을자리</td>
			<td>예문이 나올자리</td>
		</tr>

	</table>
</body>
</html>