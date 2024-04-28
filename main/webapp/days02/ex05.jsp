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
      JSP 기본 내장 객체 - request 객체
      1. 웹브라우저 -> 요청 -> 서버
      			  request
      2. 요청 정보 객체
      3. 클라이언트 전송한 파라미터, 쿠키, 헤더 정보 등등
      4.
      
      
      
      
      1. contextPath(컨텍스트 루트) : /jspPro
	  2. 클라이언트 IP 주소 : 0:0:0:0:0:0:0:1
	  3. 요청 전송 방식 : GET
	  4. 요청 URI : /jspPro/days02/ex05.jsp
	  5. 요청 URL : http://localhost:8080/jspPro/days02/ex05.jsp                
  </xmp>
  1. contextPath(컨텍스트 루트) : <%= request.getContextPath() %><br>
  2. 클라이언트 IP 주소 : <%= request.getRemoteAddr() %><br>
  3. 요청 전송 방식 : <%= request.getMethod() %><br>
  4. 요청 URI : <%= request.getRequestURI() %><br>
  5. 요청 URL : <%= request.getRequestURL() %> 
</div>

<script>
</script>
</body>
</html>