<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page buffer="8kb" autoFlush="true" %>
<%@ include file="/WEB-INF/inc/include.jspf" %>
<%-- <%@ page buffer="1kb" autoFlush="false" %> --%>
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
     out - 출력 담당 객체                
  	 서버 -> 응답(출력) -> 클라이언트
  	 out.print("홍길동")
  	 		출력버퍼 ["홍길동"] = 8kb
  	 
  </xmp>  
  <%
  	for(int i = 1; i <= 10; i++){
  		out.print("[" + i +"]");
  		if( i == 2 ){
  			/* out.flush(); */
  			out.clearBuffer();
  		}
  	}
  %>
</div>

<script>
</script>
</body>
</html>