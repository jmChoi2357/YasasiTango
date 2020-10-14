<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JLPT레벨을 선택하세요</title>
<script type="text/javascript" src="/resources/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	function level(jlpt){
		$(opener.document).find("#searchWord").val(jlpt); /* opener는 현재 창 이전의 창을 이미한다.  */
		window.close();
	}

</script>
</head>
<body>
<button class="popBtn" value="JLPT1" onclick="level('JLPT1');">JLPT1</button>
<button class="popBtn" value="JLPT2" onclick="level('JLPT2');">JLPT2</button>
<button class="popBtn" value="JLPT3" onclick="level('JLPT3');">JLPT3</button>
<button class="popBtn" value="JLPT4" onclick="level('JLPT4');">JLPT4</button>
<button class="popBtn" value="JLPT5" onclick="level('JLPT5');">JLPT5</button>

</body>
</html>