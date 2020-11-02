<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<meta charset = "utf-8">


<title>로그인 하세요</title>

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
						alert('비밀번호는 6글자 이상 10글자 이하로 입력해 주세요.')
						return false;
						}
			
						return true;
				}

				
			    }
			    </script>
</head>
<body>
<!-- Navigation -->
  <nav class="navbar navbar-light bg-light static-top">
    <div class="container">
      <a class="navbar-brand" href="/">[優しい単語]</a>
      
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
  <br>
  <br>
 
 <div class="container"><!-- 좌우측의 공간 확보 -->
            <form class="form-horizontal" method="post" action="/member/login" id="login" onsubmit="return formCheck()">
                <div class="form-group">
                    
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyAlphabetAndNumber" id="id" name="id" placeholder="아이디를 입력해주세요" maxlength="20">
                    </div>
                </div>
                
                <div class="form-group">
                   
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력해주세요" maxlength="20">
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <input type="submit" value="로그인 하기" class="btn btn-primary">
                    </div>
                </div>
            </form> 
		</div>

</body>
</html>