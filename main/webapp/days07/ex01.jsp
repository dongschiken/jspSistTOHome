<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <h1 class="main"><a href="#" style="position: absolute;top:30px;">Jindol Home</a></h1>
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
		[EL 3.0]
		EL 쿠키를 사용하는 방법
	</xmp>  
	<%
		// JSP 서버에서 쿠키
		Cookie cookie = Cookies.createCookie("user", "admin");
		response.addCookie(cookie);	
	
		cookie = Cookies.createCookie("id", "hong");
		response.addCookie(cookie);
		
		cookie = Cookies.createCookie("age", "20");
		response.addCookie(cookie);
		
	%>
	
	<a href="ex01_01.jsp">ex01_01.jsp</a>
	
</div>

<script>
</script>
</body>
</html>