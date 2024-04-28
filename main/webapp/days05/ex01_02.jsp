<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 서버에서 시작하는 경로 표시는 jspPro 까지 와있어서 / 이게 jspPro가 된다. -->
<%@ page errorPage="/WEB-INF/error/ViewErrorMessage.jsp" %> 
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
       jsp 예외 처리 방법
       1. try ~ catch ~ finally 문 사용
       2. 예외 발생하면 -> 예외 페이지를 지정 -> 응답 
       	  WEB-INF
       	  	- error 폴더 생성              
       	  		- ViewErrorMessage.jsp
       3. 
       [응답 상태 코드]
       	1) 예외 코드별로 예외 페이지 지정
          404 : 요청URL을 처리하기 위한 자원이 존재하지 않음
          500 : 서버 내부 에러가 발생( 자바 코딩 X )
          200 : 요청을 정상적으로 처리
          401 : 접근을 허용하지 않음
          400 : 클라이언트의 요청이 잘못된 구문으로 구성.
          403 : PUT 요청 X 
          등등
          ex01.jsp
          	a href = "ex1000.jsp"
        2) 예외 타입별로 예외 페이지 지정
         NullPointException
         SQLException
        3) 에러 페이지 우선 순위
         1. page errorPage
         2. 예외 타입별로 설정
         3. 상태 코드 별로 설정
         4. 아무것도 지정안하면 톰캣이 제공하는 기본 에러페이지로 이동
  </xmp>  
  
  
    <%
 	String name = null;

  	name = request.getParameter("name");
  	name = name.toUpperCase();
  	
  %>
  name = <%= name %>
</div>

<script>
</script>
</body>
</html>