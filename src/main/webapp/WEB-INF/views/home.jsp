<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

<title>main</title>	

<!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="<%=request.getContextPath()%>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath()%>/resources/css/landing-page.min.css" rel="stylesheet">
  
	<script type="text/javascript" src="/resources/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">


				function formCheck(){
					var member_id = document.getElementById('member_id').value;
					var member_pw = document.getElementById('member_pw').value;
					
						if(member_id == '' || member_id.length == 0){
						alert('please input your id.')
						return false;
			
				} else if(member_id.length < 4 || member_id.length > 10 ){
						alert('아이디는 4글자 이상 10글자 이하로 입력해 주세요.')
			
						return false;
						}
			
				if(member_pw == '' || member_pw.length == 0){
						alert('please input your password.')
						return false;
						
					} else if(member_pw.length < 5 || member_pw.length > 10){
						alert('비밀번호는 5글자 이상 10글자 이하로 입력해 주세요.')
						return false;
						}
			
						return true;
				}

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
	
	<style>
	
	#top_login { text-align : right}
	
	
	</style>
	
	
	
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
  
  
  
  <!-- Icons Grid -->
  <section class="features-icons bg-light text-center">
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
            <div style="height:130px">
            <div class="features-icons-icon d-flex">
              <i class="m-auto text-primary" ><img width="100" height="100"  src="/resources/Image/translate.png"></i>
          	</div>
            </div>
           <a class="btn btn-primary" href="/JungWooPage">번역하기</a>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
          <div style="height:130px">
            <div class="features-icons-icon d-flex">
              <i class="m-auto text-primary"><img width="100" height="100"  src="/resources/Image/quiz.png"></i>
              
            </div>    
          </div>
            <a class="btn btn-primary" href="/member/quizMain">퀴즈 풀기</a>
            
          </div>
        </div>
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-0 mb-lg-3">
            <div style="height:130px">
            <div class="features-icons-icon d-flex">
              <i class="m-auto text-primary"><img width="100" height="100"  src="/resources/Image/note.png"></i>
            </div>
            </div>
          <a class="btn btn-primary" href="/seeWordList">나의 단어장</a>
            
          </div>
        </div>
      </div>
    </div>
  </section>
		
</body>
</html>


