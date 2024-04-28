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
     1. Servlet
     	- 자바 웹 기술
     	- 로직 처리
     	- MVC 패턴 개발 ()
     2. 서블릿 구현 방법( 과정 )
     (1) [서블릿 규약]을 따르는 자바 클래스 선언
            ㄱ. 접근지정자 public
            ㄴ. javax.servlet.http.HttpServlet 클래스 상속
            ㄷ. serivce(), get(), post() 메서드를 오버라이딩.
      
      (2) 컴파일 -> ???.class (클래스파일)
      (3) /WEB-INF/classes 폴더 안에 반드시 클래스 파일 넣어둔다.
      
      (4) 요청 URL 정하고          URL 매핑
            ㄱ. web.xml 서블릿 등록/URL 매핑
            ㄴ. 서블릿 3.0 ~  @WebServlet 어노테이션으로 처리.
            
      (5) 브라우저 ->   요청 URL  ->    서블릿  -> 응답.
      
      3. 실습 예제.
      	days01.Now.java                
  </xmp>  
  
  <a href="/jspPro/days01/now.ss">/days01/now.ss</a>
  <br>
  <a href="/jspPro/days01/now">/days01/now</a>
</div>

<script>
</script>
</body>
</html>