<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      jsp 기본 내장 객체 9가지
      1. request : HttpServletRequest ( 암기 )
      2. response : HttpServletResponse
      3. out : JspWriter             
      4. exception : Throwable
      
      
      5. session : HttpSesstion
      6. application : [ServerContext] ( 암기 )
      	 웹 애플리케이션 전체 정보를 저장하는 객체
	      7. pageContext : pageContext 
	      	 JSP 페이지에 대한 정보를 저장하는 객체
	      8. page : Object
	      	 JSP 페이지를 구현한 자바 클래스 인스턴스
      9. config : ServletConfig 설정 정보 저장
  </xmp>  
</div>

<script>
</script>
</body>
</html>