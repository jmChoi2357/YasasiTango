<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        </c:when>
        
        <c:otherwise>
            <h1>검색된 결과가 없습니다!!</h1>
        </c:otherwise>
    </c:choose>
    
</body>
</html>