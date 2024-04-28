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
     ex02.jsp -> ex02_02.jsp -> ex02_03.jsp
     이름			 주소				이름/나이/주소/연락처
     나이			 연락처			[확인]
     NEXT	->   NEXT     ->   
     				   input type="hidden" 이름
     				   input type="hidden" 나이
     다른 페이지가 요청 될때
     그 이전 페이지에서 입력받은 값들을 
     어떻게 유지할 수 있을까??
     [ 상태관리 ] DB, 세션, 쿠키( 팀과제 )
                   	  
  </xmp>  
  <form action="ex02_02.jsp" method="get">
    name : <input type="text" name="name" value="홍길동"><br>
    age : <input type="text" name="age" value="20"><br>
    <input type="submit" value="Next">
  </form>
</div>

<script>
</script>
</body>
</html>