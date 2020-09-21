<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
    <script type="text/javascript" src="/resources/jquery-3.5.1.min.js"></script>
    <style>
        textarea{
            margin: 0 auto;
            /* display:block; */
            resize: none;
        }
        table{
           margin: 0 auto; 
        }
    </style>
    
    <script>
        /* 파파고 변역용  */
        function papa(){
    	    var test = {"original_str": $("#send_text").val(),
    	    	        "code": $("#selectLang").val()};
        	$.ajax({
    		    type: "POST",
    		    url: "/nmtReturnRseult",
    		    data: test, //json을 보내는 방법
    		    success: function (data) { //서블렛을 통한 결과 값을 받을 수 있습니다.
    		    console.log(data);
    		    //결과값을 textarea에 넣기 위해서
    		    var resulut_obj = JSON.parse(data);
    		    $("#result_text").val(resulut_obj.message.result.translatedText);
    		    },
    		    error: function (e) {
    		    alert('실패했습니다.');
    		    console.log(e);
    		    }
    		    });
       }// papa end

       /* 한글 검색인지 일본어 검색인지 판별 */
       function changeLang(){
    	   if($("#langCode").text() == "한국어 -> 일본어"){
    		   $("#langCode").text("일본어 -> 한국어");
    		   $("#selectLang").val("jp");
           }

    	   else if($("#langCode").text() == "일본어 -> 한국어"){
    		   $("#langCode").text("한국어 -> 일본어");
    		   $("#selectLang").val("kr");
           }
       }

       function text_to_speech(){
       	var test = {"voice": $("#result_text").val(),
       			     "code": $("#selectLang").val()};
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
<meta charset="UTF-8">
<title>번역 페이지</title>
</head>
<body>
<h1 class="top">YASHSHITANGO</h1>
<hr> <br><br>
    <table>
        <tr>
            <th colspan="2"><h2 id="langCode">한국어 -> 일본어</h2></th>
            <th align="right">
                <button onclick="speech_to_text();"><img width="40" height="40"  src="/resources/Image/misc.png"></button>
                <button><img width="40" height="40"  src="/resources/Image/change.png"></button>
            </th>
            <th></th>
            <th align="right" onclick="text_to_speech();"><button class="img-button"><img width="40" height="40"  src="/resources/Image/voice.png"></button></th>
        </tr>
        <tr>
            <th colspan="3"><textarea rows="15" cols="80" id="send_text" placeholder="번역 문장 입력"></textarea></th>
            <th colspan="3"><textarea rows="15" cols="80" id="result_text" placeholder="번역 출력"  readonly></textarea></th>
        </tr>
        <tr>
            <td>
                <input type="file" value="이미지 검색" title="이미지">
            </td>
            <td></td>
            <td align="right"><button onclick="papa();">번역하기</button></td>
            <td colspan="3"></td>
        </tr>
    </table>
    <input type="hidden" id="selectLang" value="kr">
</body>
</html>

