<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content = "text/html; charset = utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<meta charset = "utf-8">
<title>wordList</title>
<meta name = "viewport" content = "width=device-width, initial-scale = 1">

<!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="<%=request.getContextPath()%>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath()%>/resources/css/landing-page.min.css" rel="stylesheet">
  
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript">

			var clareCalendar = {
					   monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
					   dayNamesMin: ['일','월','화','수','목','금','토'],
					   weekHeader: 'Wk',
					   dateFormat: 'yymmdd', //형식(20120303)
					   autoSize: false, //오토리사이즈(body등 상위태그의 설정에 따른다)
					   changeMonth: true, //월변경가능
					   changeYear: true, //년변경가능
					   showMonthAfterYear: true, //년 뒤에 월 표시

					   yearRange: '1990:2020' //1990년부터 2020년까지
					  };
$(function(){

		var type = $("#searchType option:selected").val();
	// 로딩되면 바뀌지않음
		if(type == "date") {
					  $("#searchWord").datepicker(clareCalendar);
					  $("img.ui-datepicker-trigger").attr("style","margin-left:5px; vertical-align:middle; cursor:pointer;"); //이미지버튼 style적용
			};

	$("#searchWord").click(function(){
		
		if(type == "level"){ 
			openPop();
		};
		
	});	

	$("#searchType").change(function(e){
		type = $("#searchType option:selected").val();
		if(type != "date") $("#searchWord").datepicker( "destroy" );
		else $("#searchWord").datepicker(clareCalendar);
	});
});

function openPop(){
	var popup = window.open("/popup/jlptLevel", "JLPT레벨을 선택해주세요", "width=400px,height=30px");
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
          <form action="/seeWordList">
            <div class="form-row">
              <div class="col-12 col-md-9 mb-2 mb-md-0">
                <input type="text" id="searchWord" name="searchWord" class="form-control form-control-lg" placeholder="enter word" autocomplete="off">
              </div>
                  <select id="searchType" name="searchType" class="form-control" style="height:50px; width:80px">
                    <option value="date">날짜</option>
					<option value="level">레벨</option>
                  </select>
                  &nbsp;&nbsp;
                  <input type="submit" value="검색" class="btn btn-primary" style="height:50px; width:70px">          
            </div>
          </form>
        </div>
      </div>
    </div>
    </div>
  </header>
	
	<br>
	<div class="container">
		<c:choose>
		<c:when test="${not empty list }"> 
		<c:forEach items="${list }" var="list">
		<ul class="list-group">
            <li class="list-group-item"><b>${list.SEARCHED_DATE }</b> &nbsp;&nbsp;Level: ${list.WORD_LEVEL }&nbsp;&nbsp; <b>${list.KANJI } [${list.HIRAGANA }]</b>&nbsp;&nbsp; ${list.KOREAN}</li>
            <li class="list-group-item"><b>예문</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ${list.EXAMPLE }&nbsp;&nbsp; ${list.EXAMPLE_KOREAN}</li>
          </ul>
		<br>
		</c:forEach>
		</c:when> 
		<c:otherwise>
			<h3>정보가 없습니다.</h3>
		</c:otherwise>
			
		</c:choose>
	</div>
	

	

</body>
</html>