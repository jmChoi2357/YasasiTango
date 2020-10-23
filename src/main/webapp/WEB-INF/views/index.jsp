<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>test</title>
	
  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="<%=request.getContextPath()%>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath()%>/resources/css/landing-page.min.css" rel="stylesheet">
  
  <style type="text/css">
      #top_login { text-align : right}
	

</style>
  

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-light bg-light static-top">
    <div class="container">
      <a class="navbar-brand" href="#">yasashi</a>
      
      <div id="top_login">
      
      <a class="btn btn-primary" href="#">login</a>
      &nbsp;&nbsp;
	  <a class="btn btn-primary" href="#">Sign Up</a> 
      
      </div>
    </div>
  </nav>

  <!-- Masthead -->
  <header>
    <div style="height:160px">
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <h1 class="mb-5">yasashi</h1>
        </div>
        <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
          <form>
            <div class="form-row">
              <div class="col-12 col-md-9 mb-2 mb-md-0">
                <input type="text" class="form-control form-control-lg" placeholder="enter word">
              </div>
              <div class="col-12 col-md-3">
                <button type="submit" class="btn btn-primary" style="height:50px; width:70px">enter</button>
                 <button type="submit" class="btn btn-primary" style="height:50px; width:70px">음성</button>
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
           <a class="btn btn-primary" href="#">번역하기</a>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
          <div style="height:130px">
            <div class="features-icons-icon d-flex">
              <i class="m-auto text-primary"><img width="100" height="100"  src="/resources/Image/quiz.png"></i>
              
            </div>    
          </div>
            <a class="btn btn-primary" href="#">퀴즈 풀기</a>
            
          </div>
        </div>
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-0 mb-lg-3">
            <div style="height:130px">
            <div class="features-icons-icon d-flex">
              <i class="m-auto text-primary"><img width="100" height="100"  src="/resources/Image/note.png"></i>
            </div>
            </div>
          <a class="btn btn-primary" href="#">나의 단어장</a>
            
          </div>
        </div>
      </div>
    </div>
  </section>


  <!-- Footer -->
  <footer class="footer bg-light">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 h-100 text-center text-lg-left my-auto">
          <ul class="list-inline mb-2">
            <li class="list-inline-item">
              <a href="#">About</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">Contact</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">Terms of Use</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">Privacy Policy</a>
            </li>
          </ul>
          <p class="text-muted small mb-4 mb-lg-0">&copy; SC IT MASTER CLASS B 3GROUP. All Rights Reserved.</p>
        </div>
        <div class="col-lg-6 h-100 text-center text-lg-right my-auto">
          <ul class="list-inline mb-0">
            <li class="list-inline-item mr-3">
              <a href="#">
                <i class="fab fa-facebook fa-2x fa-fw"></i>
              </a>
            </li>
            <li class="list-inline-item mr-3">
              <a href="#">
                <i class="fab fa-twitter-square fa-2x fa-fw"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <i class="fab fa-instagram fa-2x fa-fw"></i>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer>

  
</body>

</html>
