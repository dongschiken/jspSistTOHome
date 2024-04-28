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
      js 쿠키 document.cookie 속성
      jsp 쿠키             
     	- 쿠키?
     	  클라이언트(브라우저) + 텍스트 형식
     	  - 클라이언트 -> 요청(쿠키) -> 서버
     	  				path		
     	  						JSP로 쿠키 사용
     	- 쿠키생성
     		1) js 클라이언트에서 쿠키 저장
     			- document.cookie 속성
     				cookie이름=쿠키값; 만료시점=10일후; domain=; path=; security=;
     		2) jsp 서버에서 쿠키 저장 -> jsp에서는 쿠키 생성, 삭제, 수정 x -> 클라이언트에 요청을 보내서 처리
     			쿠키 생성
     			쿠키 수정
     			쿠키 삭제
     		3) 클라이언트 -> 서버
     					  쿠키 생성
     		   클라이언트 <- 서버(쿠키 생성, 삭제, 수정 명령)
     		   
     		4) JSP Cookie 클래스 -> 객체 생성 ( 쿠키 생성 )
     		5) response.addCookie( 생성 쿠키 );
     			만료 시점 -1 => 브라우저를 닫을 때 자동으로 쿠키 삭제
     			만료 시점  0 => 쿠키를 제거하겠다.
     			만료 시점  X => 브라우저가 닫힐 때 쿠키가 제거된다.
     		
  </xmp>  
</div>

<script>
</script>
</body>
</html>