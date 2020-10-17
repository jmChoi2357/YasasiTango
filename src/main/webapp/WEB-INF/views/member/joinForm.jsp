<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
	<form action="/member/join" method="post" onsubmit="return joinCheck()">
		<table border=1>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" id="id"></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" name="pw" id="pw"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<th>JLPT레벨</th>
				<td><input type="text" name="jlpt_level"></td>
			</tr>
		</table>
		<input type="submit" value="가입하기">
	</form>
</body>
</html>