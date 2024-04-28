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
      자바 빈즈( java Bean )과 jsp:useBean 액션태그
      
      1. 자바빈 == 자바빈즈
      	- JSP 기반 웹 애플리케이션에서
      	  정보를 표현( 저장, 출력 )할 때 사용하는 객체
      	- VO, DTO도 자바 빈즈라고 생각해도 된다.
     2. 자바빈 규약을 따라야한다.
     	1) 필드는 private으로 선언
     	2) getter, setter 선언
     	3) 직렬화가 가능한 클래스로 선언해야한다.
     3. 자바빈은 속성, 변경 이벤트, 객체 직렬화하기위한 표준이다.
     
     [ 실습 ]
     days05.MemberInfo.java       
     ex05_02.jsp        
  </xmp>  
</div>

<script>
</script>
</body>
</html>