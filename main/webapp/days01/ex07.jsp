<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%= contextPath %>/resources/cdn-main/example.css">
<script src="<%= contextPath %>/resources/cdn-main/example.js"></script>
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
     URL - http://localhost:8080/context path/days01/ex07.jsp 
     contextPath로 바꾸기
                    
  </xmp>  
</div>

contextPath = <%= contextPath %>
<script>
</script>
</body>
</html>