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
     한 사용자가 접속해 있는 동안 사용할 값은 session 스코프에 저장해야한다.     
     		예 : 인증 + 권한 , 장바구니, 검색
     application scope : 모든 사용자가 공유한 값           
  </xmp>  
  <%
  pageContext.setAttribute("name", "admin");
  request.setAttribute("age", 20);
  session.setAttribute("addr", "서울 역삼동");
  application.setAttribute("tel", "010-");
  %>
  
  >p name : <%= pageContext.getAttribute("name") %><br>
  >p age : <%= request.getAttribute("age") %><br>
  >p addr : <%= session.getAttribute("addr") %><br>
  
  >p tel : <%= application.getAttribute("tel") %><br>
  
  <br>
  <a href="ex02_03.jsp">ex02_03.jsp</a>
</div>

<script>
</script>
</body>
</html>