<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kenik HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<h3>
  <span class="material-symbols-outlined">view_list</span> jsp days00
</h3>
<div>
  <xmp class="code">
      [ 서블릿 ]
      1. 자바 웹 기술
      2. 서블릿 처리 과정
       -web.xml 서블릿 등록 + URL 매핑
       -@어노테이션 사용.              
  </xmp>  
  <xmp>
  	*****(중요) [ URL 패턴 매핑 규칙 ]
  		1. 그냥 /는 웹 사이트 (웹 애플리케이션)에서 모든 요청의 사용되는 
  		   기본 서블릿으로 매핑 시키겠다.
  		2. 무조건 / 로 시작해야하고  /* 로 끝나야한다.
  		   서버 실행안되면 xml파일을 먼저 찾아봐라 
  		3. . 확장자명
  		
  		4. 위의 1, 2, 3을 제외하고 정확한 URL 매핑
  </xmp>
  <a href="/jspPro/hello">hello 요청</a>
  <br>
  <a href="/jspPro/days02/hello.html">days02/hello.html 요청</a>
  <br>
  <a href="/jspPro/days03/board/list.do">days02/board/list.do요청</a>
  <br>
  <a href="/jspPro/days03/board/write.html">days02/board/write.html요청</a>
  <br>
  <a href="/jspPro/days03/board/detail">days02/board/detail요청</a>
  <br>
  <a href="/jspPro/days03/board/list.do.htm">days02/board/list.do요청</a>
  <br>
  <a href="/jspPro/write.htm">days02/board/write.html요청</a>
  <br>
  <a href="/jspPro/detail.htm">days02/board/detail요청</a>
  <br>
</div>

<script>
</script>
</body>
</html>