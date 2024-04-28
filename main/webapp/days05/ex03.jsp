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
     페이지 모듈화 
     하나의 웹 사이트(애플리케이션)을 구성하는 페이지의 상단, 하단, 메뉴 등등 모든 웹페이지
     공통적인 부분을 모듈화 시켜서 코드의 중복을 제거하고 생산성을 향상, 유지, 보수, 확장성이 용이핟,
     
     모든 페이지의 상단, 하단
     	webapp 폴더
     		- layout 폴더 생성
     			-top.jsp
     			-bottom.jsp
     일정 관리 부분 : 공통모듈 / 좌, 우측 모듈               
  	 모듈화 처리 방법
  	 1) include 지시자
  	 2) jsp:include 액션 태그
  	 
  	 [include] 지시자 방법과 jsp:include 액션태그를 사용하는 방법 둘다 사용 가능
  	ex03_template.jsp
  </xmp>  
  
</div>

<script>
</script>
</body>
</html>