<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
        <script src="http://code.jquery.com/jquery.js"></script>
        <!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        
<title>단어검색 기능</title>
<!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="<%=request.getContextPath()%>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath()%>/resources/css/landing-page.min.css" rel="stylesheet">
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
<!-- Navigation -->
  <nav class="navbar navbar-light bg-light static-top">
    <div class="container">
      <a class="navbar-brand" href="/">[優し単語]</a>
      
      <div id="top_login">
      <c:choose>
      	<c:when test="${not empty sessionScope.loginId }">
	    	<div class="btn"><b>${sessionScope.loginId }님 환영합니다!</b></div>
	    	&nbsp;&nbsp;
	    	<a class="btn btn-primary" href="/member/logout">Logout</a>
		</c:when>
		<c:otherwise>		
	      <a class="btn btn-primary" href="/loginPage">login</a>
	      &nbsp;&nbsp;
		  <a class="btn btn-primary" href="/member/joinForm">회원가입</a> 
		</c:otherwise>
      </c:choose>
      </div>
    </div>
  </nav>
  
  <!-- Masthead -->
  <header>
    <div style="height:160px">
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <h1 class="mb-5">
			
		</h1>
        </div>
        <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
          <form action="/searchResult" onsubmit="return KoCheck();">
            <div class="form-row">
              <div class="col-12 col-md-9 mb-2 mb-md-0">
                <input type="text" id="lang" name="lang" class="form-control form-control-lg" placeholder="enter word">
              </div>
              <div class="col-12 col-md-3">
                <button type="submit" id="send_text" class="btn btn-primary" style="height:50px; width:70px">검색</button>
                 <div onclick="speech_to_text();" class="btn btn-primary" style="height:50px; width:70px"><img width="40" height="40"  src="/resources/Image/misc.png"></div>
            		<input type="hidden" id="langCheck" name="langCheck">
            		<input type="hidden" id="selectLang" value="jp">
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    </div>
  </header>

    
    <hr>
    
    
    
    <div class="container">
	    <c:choose>
	        <c:when test="${not empty tango.kanji }">
	            <h4>검색결과</h4>
	            <br>
	            <h1 style="display:inline;">${tango.kanji }</h1>
	            <h1 style="display:inline;">[${tango.hiragana }]</h1>
	             <button class="img-button" onclick="text_to_speech();"><img width="40" height="40"  src="/resources/Image/voice.png"></button>	 
	            <h2>${tango.korean }</h2>
	            <hr>
	            <h3>${tango.example }</h3>
	            <h3>${tango.example_korean }</h3>
	            <input type="hidden" value="${tango.kanji }" id="result_text">
	        </c:when>
	        
	        <c:otherwise>
	            <h1>검색된 결과가 없습니다!!</h1>
	        </c:otherwise>
	    </c:choose>
    </div>
  
    
</body>
</html>