<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content = "text/html; charset = utf-8">
<title>wordList</title>
<meta name = "viewport" content = "width=device-width, initial-scale = 1">

<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript">
			var clareCalendar = {
					   monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
					   dayNamesMin: ['일','월','화','수','목','금','토'],
					   weekHeader: 'Wk',
					   dateFormat: 'yymmdd', //형식(20120303)
					   autoSize: false, //오토리사이즈(body등 상위태그의 설정에 따른다)
					   changeMonth: true, //월변경가능
					   changeYear: true, //년변경가능
					   showMonthAfterYear: true, //년 뒤에 월 표시

					   yearRange: '1990:2020' //1990년부터 2020년까지
					  };
$(function(){

		var type = $("#searchType option:selected").val();
	// 로딩되면 바뀌지않음
		if(type == "date") {
					  $("#searchWord").datepicker(clareCalendar);
					  $("img.ui-datepicker-trigger").attr("style","margin-left:5px; vertical-align:middle; cursor:pointer;"); //이미지버튼 style적용
			};

	$("#searchWord").click(function(){
		
		if(type == "level"){ 
			
			openPop();
		};
		if(type == "wordForm") {
			openPopWord();
		}
	});	

	$("#searchType").change(function(e){
		type = $("#searchType option:selected").val();
		if(type != "date") $("#searchWord").datepicker( "destroy" );
		else $("#searchWord").datepicker(clareCalendar);
	});
});

function openPop(){
	var popup = window.open("/popup/jlptLevel", "JLPT레벨을 선택해주세요", "width=200px,height=50px");
}

function openPopWord(){
	var popup = window.open("/popup/wordForm", "품사를 선택해주세요", "width=200px,height=50px");
}

function search(){
	var type = $("#searchType option:selected").val();	
	location.href = "/seeWordList?type=" + type;
}
</script>
</head>
<body>
	<form>
		<input type="text" id="searchWord" value="">
		<select id="searchType">
			<option value="date">날짜선택</option>
			<option value="level">레벨선택</option>
			<option value="wordForm">품사선택</option>
		</select>
		
		<input type="button" value="검색" onclick="search();">
	</form>
	
	<br>
	
	<c:choose>
	<c:when test="${list != null}"> 
	<c:forEach items="${list }" var="list">
		<table>
			<tr>
				<th>${list.date }</th>
				<td>${list.level } ${list.hiragana } ${list.kanji } ${list.lisetning}아이콘</td>
			</tr>
			<tr>
				<td></td>
				<td>예문 ${list.example }</td>
			</tr>
			</table>
	
	</c:forEach>
	</c:when>
	<c:otherwise>
		<h3>정보가 없습니다.</h3>
	</c:otherwise>
		
	</c:choose>
	
	<a href="#none" target="_blank" onclick="openPop()">팝업</a>
	<a href="/calender">달력</a>
	
	test
​
</body>
</html>