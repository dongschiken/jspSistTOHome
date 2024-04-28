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
     JSP 기본 내장 객체(9가지) - response
     	- 웹 브라우저에 보내는 응답 정보를 담는 객체
     	- 헤드 정보
     	- 리다이렉트(redirect)와 포워딩(forward) 차이점	
     	 (방향바꾸기)
     	- ex09.jsp : ID와 PASSWORD 입력받아서 로그인 페이지 - 인증처리
     	- ex09_ok.jsp : 로그인 인증 성공하면 -> ex09_main.jsp 페이지로 이동
     					로그인 인증 실패하면 -> ex09.jsp?error를 들고 이동
     					
     	- ex09.jsp				name = null
     	- ex09.jsp?name			name = ""
     	- ex09.jsp?name=admin	name = "admin"
     	
     	String name = request.getParameter("name");
     	               
  </xmp>  
</div>

<script>
</script>
</body>
</html>