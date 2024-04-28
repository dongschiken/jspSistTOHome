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
     2:00 수업시작
     JSP 필터 ( filter )        
     	- http 요청/응답
     		- reqeust 요청 정보를 필터링
     					- 필수입력
     						currentPage=1
     						등등
     		- response 응답 정보를 가공 ( 암호화 , xml -> json )
     	- 인증( 로그인 ) 필터 -  요청할 수 있는 페이지
     				  승인 -> 요청 페이지로 이동
     				  X -> 로그인 페이지로 이동
		예)
		list.do( 글 목록 )
		list.jsp 응답
		1번 방법 [ 글쓰기 ] ------- write do --------	-> writeHandler 요청( write.jsp 가기전에 세션에 auth의 값이 있는지?? // 로그인 한사람이 누구인지 check)
		2번 방법 [ 글쓰기 ] ------- write do --------	-> (로그인 체크 필터) -> writeHandler -> wrtie.jsp
						   로그인 승인 받아야 글쓰기 가능
		
			
	    필터 구현시 핵심 3개 타입
	    1. javax.servlet.Filter 인터페이스 구현
	    	1) init() 초기화 함수
	    	2) destroy() 
	    	3) doFilter() -> 매우 중요함
	    	   인증체크, 인코딩 체크 등등 작업
	    	4) chain.doFilter() 다음필터로 넘기는 메서드
	    2. ServletRequestWrapper
	    	- 요청 포장(가공, 변경)하는 객체
	    3. ServletResponseWrapper	
	    	- 응답 포장(가공, 변경)하는 객체
	    		- 암호화(응답데이터)
	    		  xml -> json(변경)
	    		  
	   [lib 폴더에 servlet-api.jar파일 추가]
	   	- 이클립스로 개발할 경우에는 추가할 필요가 없다.
	   	
	   [필터 사용하는 순서]
	   1. 필터 클래스 선언
	   2. web.xml로 필터 등록
	   	  또는 
	   	  @WebFilter 어노테이션 등록
	   3. 실습)
	   		- ex06.jsp		form method="post"  한글깨짐
	   		- ex06_02.jsp	
	   		com.filter 패키지
	   			- CharacterEncodingFilter.java
	   		
	    					   
	        		
  </xmp>  
</div>

<script>
</script>
</body>
</html>