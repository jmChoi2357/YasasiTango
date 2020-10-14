<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/resources/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	function wordForm(wordForm){
		$(opener.document).find("#searchWord").val(wordForm);	
		window.close();
	}


</script>
</head>
<body>
<button class="popBtn" value="verb" onclick="wordForm('동사');">동사</button>
<button class="popBtn" value="adjective" onclick="wordForm('형용사');">형용사</button>
<button class="popBtn" value="adverb" onclick="wordForm('부사');">부사</button>
<button class="popBtn" value="Josa" onclick="wordForm('조사');">조사</button>
<button class="popBtn" value="noun" onclick="wordForm('명사');">명사</button>

</body>
</html>