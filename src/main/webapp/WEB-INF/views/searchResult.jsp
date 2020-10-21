<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/jquery-3.5.1.min.js"></script>
<script>
    function KoCheck(e){
        var lang = document.getElementById('lang').value;
         var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
         if(check.test(lang)){
            document.getElementById('langCheck').value = "ko";
         }else{
            document.getElementById('langCheck').value = "jp";
         }
         return true;
    }

    function text_to_speech(){
        alert($("#result_text").val());
       	var test = {"voice": $("#result_text").val(),
       			     "code": "ko"};
       	$.ajax({
       		type: "POST",
       		url: "/text_to_speech",
       		data: test, //json을 보내는 방법
       		success: function (data) { 
       		},
       		error: function (e) {
       		alert('실패했습니다.');
       		console.log(e);
       		}
       		});
       }

    function speech_to_text(){
    	$("#send_text").val("음성입력 시작!");
    	var test = {"code": $("#selectLang").val()};
       	$.ajax({
       		type: "POST",
       		data: test,
       		url: "/speech_to_text",	
       		success: function (data) { 
       		$("#send_text").val(data);
       		},
       		error: function (e) {
       		alert('실패했습니다.');
       		console.log(e);
       		}

           });
       }
</script>
</head>
<body>
    <h1 align="center">優し単語</h1>
    <hr style="border: solid 5px blue;">
    
    <form action="/searchResult" align="center"  onsubmit="return KoCheck();">
        <input type="text" size="50" id="lang" name="lang">
        <input type ="submit" value="검색">
        <input type = "hidden" id="langCheck" name="langCheck">
    </form>
    <button class="img-button" onclick="text_to_speech();"><img width="40" height="40"  src="/resources/Image/voice.png"></button>
    
    <c:choose>
        <c:when test="${not empty tango.kanji }">
            <h1>검색결과</h1>
            <h1 style="display:inline;">${tango.kanji }</h1>
            <h1 style="display:inline;">[${tango.hiragana }]</h1>
            <h3>${tango.korean }</h3>
            <br>
            <hr style="border: solid 5px blue;">
            <h3>${tango.example }</h3>
            <h3>${tango.example_korean }</h3>
            <input type="hidden" value="${tango.kanji }" id="result_text">
        </c:when>
        
        <c:otherwise>
            <h1>검색된 결과가 없습니다!!</h1>
        </c:otherwise>
    </c:choose>
    
    <button onclick ="location.href='/'">HOME으로 돌아가기</button>
    
</body>
</html>