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
    	    var test = {"original_str": $("#send_text").val()};
        	$.ajax({
    		    type: "POST",
    		    url: "/nmtReturnRseult",
    		    data: test, //json을 보내는 방법
    		    success: function (data) { //서블렛을 통한 결과 값을 받을 수 있습니다.
    		    console.log(data);
    		    alert(data);
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
    </script>
<meta charset="UTF-8">
<title>번역 페이지</title>
</head>
<body>
<h1 class="top">YASHSHITANGO</h1>

<hr> <br><br>
    <table>
        <tr>
            <th colspan="3"><textarea rows="15" cols="80" id="send_text">검색 에이리어</textarea></th>
            <th colspan="3"><textarea rows="15" cols="80" id="result_text">결과 에이리어k</textarea></th>
        </tr>
        <tr>
            <td><button>이미지 검색</button><button>음성검색</button></td>
            <td></td>
            <td align="right"><button onclick="papa();">번역하기</button></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</body>
</html>