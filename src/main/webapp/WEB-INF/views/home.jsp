<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset = "utf-8">
<title>main</title>	
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
	</script>
	
	<style>
		.a{
			background-color: #BBDEFB;
		}
		
		.b{
			background-color: #BBDEFB;
		}
	</style>
	
	<style> 
		.topMenu { // topMenu의 ID를 가진 태그의 스타일 지정 
			height: 30px; // topMenu의 높이를 30px로 설정(제대로 설정 안하면 아래 내용이 깨짐) 
			width: 850px; // topMenu의 넓이를 850px로 설정(제대로 설정 안하면 브라우져 넓이가 좁아지면 깨짐) 
		} 
		
		.topMenu ul li { // topMenu의 ID를 가진 태그 안에 <ul> 태그 안에 <li> 태그의 스타일을 지정 
			list-style: none; // <li> 태그는 위의 이미지처럼 목록을 나타내는 점을 없앤다 
			color: white; // 글씨 색을 흰색으로 설정 
			background-color: #2d2d2d; // 배경색을 진한 회색(RGB(2D,2D,2D)으로 설정 
			float: left; // <li>태그들이 왼쪽에 흐르게 설정(그러면 아래있는 내용은 오른쪽으로 옴) 
			line-height: 30px; // 글씨가 가운데로 오도록 설정하기 위해 한줄의 높이를 30px로 설정 
			vertical-align: middle; // 세로 정렬을 가운데로 설정(위의 line-height와 같이 설정 필요함) 
			text-align: center; // 글씨 정렬을 가운데로 설정 
		} 
		
		.topMenu .menuLink { // topMenu 아이디를 가진 태그 안에 있는 menuLink 클래스 태그들의 스타일 설정 
			text-decoration:none; // 링크(<a> 태그)가 가지는 기본 꾸밈 효과(밑줄 등)을 없앰 
			color: white; // 폰트색을 흰색으로 설정 
			display: block; // 링크를 글씨가 있는 부분 뿐만아니라 전체 영역을 클릭해도 링크가 걸리게 설정
			width: 150px; // 메뉴링크의 넓이 설정 
			font-size: 12px; // 폰트 사이즈 12px로 설정 
			font-weight: bold; // 폰트를 굵게 
			font-family: "Trebuchet MS", Dotum, Arial; // 기본 폰트 적용, 시스템 폰트를 종류별로 순서대로 
		} 
		
		.topMenu .menuLink:hover { //topMenu 아이디를 가진 태그 안에 menuLink클래스를 가진 태그에 마우스가 over되면 스타일 설정 
			color: red; // 글씨 색을 붉은색으로 설정 
			background-color: #4d4d4d; // 배경색을 조금 더 밝은 회색으로 설정 
		} 
	</style>
	
</head>
<body>	
	<h1 class="b"><center> [優し単語]　 </center></h1>
	<c:if test="${not empty sessionScope.loginId }">
	    <h1>${sessionScope.loginId }님 환영합니다!</h1>
	</c:if>

	
	<hr style="border: solid 5px blue;">
	
	

	
	<h2 class="a">

	

		<h2> JLPT 등급별 퀴즈풀기 </h2>

		<c:choose>
		    <c:when test="${not empty sessionScope.loginId }">
		        <button onclick="location.href='/member/logout'">로그아웃</button>
		        <button onclick="location.href='/member/quizMain'">퀴즈 페이지</button>
		    </c:when>
		    <c:otherwise>
		       <form action="/member/login" method="post" id="login" onsubmit="return formCheck()">
				ID : <input type = "text" autofocus name="member_id" id="member_id" placeholder="4글자 이상 10글자 이하" maxlength="11"><br>
				PW : <input type = "password" autofocus name="member_pw" id="member_pw" placeholder="5글자 이상 10글자 이하" maxlength="11"><br>
				</form>
				<button type="submit" form="login">테스트로그인</button>
				<button onclick="location.href='/member/joinForm'">회원가입</button>
		    </c:otherwise>
		</c:choose>
	</h2>
	
	<form action="/searchTango">
	    <input type = "submit" value="검색 페이지 이동">
	</form>
	
	
		<h2> JLPT 등급별 퀴즈풀기 </h2>

		<h3>
			<input type ="radio" name ="rd"> JLPT1
			<input type ="radio" name ="rd"> JLPT2
			<input type ="radio" name ="rd"> JLPT3
			<input type ="radio" name ="rd"> JLPT4
			<input type ="radio" name ="rd"> JLPT5
		 </h3>
	 
	
	<br> 
		<button onclick ="location.href='/JungWooPage'">번역하기 </button>
	
	<br>
		<button onclick ="location.href='/seeWordList'">나의 단어장</button>
		
</body>
</html>


