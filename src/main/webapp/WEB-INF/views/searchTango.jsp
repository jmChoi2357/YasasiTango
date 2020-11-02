<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>優し単語</title>
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

    function speech_to_text(){
    	$("#lang").val("음성입력 시작!");
    	var test = {"code": $("#selectLang").val()};
       	$.ajax({
       		type: "POST",
       		data: test,
       		url: "/speech_to_text",	
       		success: function (data) { 
       		$("#lang").val(data);
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
    <h1 align="center">優しい単語</h1>
    <hr style="border: solid 5px blue;">
    
    <form action="/searchResult" align="center"  onsubmit="return KoCheck();">
        <input type="text" size="50" id="lang" name="lang"> <br>
        <input type ="submit" value="검색" id="send_text">
        <input type = "hidden" id="langCheck" name="langCheck">
    </form>
    <button onclick="speech_to_text();"><img width="40" height="40"  src="/resources/Image/misc.png"></button>
    
    <button onclick ="location.href='/'">HOME으로 돌아가기</button>
    <input type="hidden" id="selectLang" value="jp">
</body>
</html>