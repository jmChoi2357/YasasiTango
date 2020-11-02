<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="utf-8">
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입</title>
        <!-- Bootstrap -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
        <script src="http://code.jquery.com/jquery.js"></script>
        <!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        
        
         
        <script type="text/javascript" src="/resources/jquery-3.5.1.min.js"></script>
		<script type="text/javascript">
        
        function joinCheck(){
    		var id = $("#id").val();
    		var pw = $("#pw").val();
    		var name = $("#name").val();

    		if(id == ""){
    			alert("id를 입력해 주세요");
    			return false;
    		}

    		if(id.length< 3 || id.length > 10){
    			alert("id를 3~10자리로 입력해주세요")
    			return false;
    		}

    		if(pw == ""){
    			alert("pw를 입력해 주세요");
    			return false;
    		}

    		if(pw.length < 6 || pw.length > 12){
    			alert("비밀번호를 6~12자리로 입력해 주세요 ")
    			return false;
    		}

    		if(name == ""){
    			alert("name을 입력해 주세요");
    			return false;
    		}
    		return true;
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
            <form class="form-horizontal" method="post" action="/member/join" onsubmit="return joinCheck()">
                <div class="form-group">
                    <label for="inputId" class="col-lg-2 control-label">아이디</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyAlphabetAndNumber" id="id" name="id" placeholder="Id를 3~10자리로 입력해주세요" maxlength="20">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 6~12자리로 입력해 주세요 " maxlength="20">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="inputName" class="col-lg-2 control-label">이름</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyHangul" id="name" name="name" placeholder="이름을 입력 하세요." maxlength="10">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="inputName" class="col-lg-2 control-label">JLPT레벨</label>
                    <div class="col-lg-10">
                       <select name="jlpt_level" class="form-control">
                        <option value="1">N1</option>
                        <option value="2">N2</option>
                        <option value="3">N3</option>
                        <option value="4">N4</option>
                        <option value="5">N5</option>
                    </select>
                    </div>
                </div>
                
               
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <input type="submit" value="가입하기" class="btn btn-primary">
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
