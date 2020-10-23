<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>JLPT레벨을 선택하세요</title>
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

	function level(jlpt){
		$(opener.document).find("#searchWord").val(jlpt); /* opener는 현재 창 이전의 창을 이미한다.  */
		window.close();
	}

</script>
</head>
<body>
<br>

<button class="btn btn-primary" value="JLPT1" onclick="level('1');">JLPT1</button>&nbsp;&nbsp;
<button class="btn btn-primary" value="JLPT2" onclick="level('2');">JLPT2</button>&nbsp;&nbsp;
<button class="btn btn-primary" value="JLPT3" onclick="level('3');">JLPT3</button>&nbsp;&nbsp;
<button class="btn btn-primary" value="JLPT4" onclick="level('4');">JLPT4</button>&nbsp;&nbsp;
<button class="btn btn-primary" value="JLPT5" onclick="level('5');">JLPT5</button>

</body>
</html>