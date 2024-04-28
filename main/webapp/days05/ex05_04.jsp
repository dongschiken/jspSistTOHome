<%@page import="java.util.Date"%>
<%@page import="days05.MemberInfo"%>
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
        ex05_02.jsp 입력한 값을 받아서
        MemberInfo.java 객체로 생성후 사용
        jsp:useBean 액션 태그로 객체를 생성 후 사용             
  </xmp>
  
  <%
  	String id = request.getParameter("id");
  	String name = request.getParameter("name");
  	String password = request.getParameter("password");
  	String email = request.getParameter("email");
  	
/*   	MemberInfo mi = new MemberInfo();
  		mi.setId(id);
  		mi.setName(name);
  		mi.setPassword(password);
  		mi.setEmail(email);
  		// 등록일
  		mi.setRegisterDate(new Date()); */
  		
  %>
  <jsp:useBean id="mi" class="days05.MemberInfo" scope="page"></jsp:useBean>
  <jsp:setProperty property="id" name="mi" value="<%= id %>" />
  <jsp:setProperty property="name" name="mi" value="<%= name %>" />
  <jsp:setProperty property="password" name="mi" value="<%= password %>" />
  <jsp:setProperty property="email" name="mi" value="<%= email %>" />
  <jsp:setProperty property="registerDate" name="mi" value="<%= new Date() %>" />
 
  <!-- 자바 빈 객체를 사용 -->
  아이디 : 
  이름 :  <%= mi.getName() %>
  비밀번호 : <%= mi.getPassword() %>
  등록일 : <%= mi.getEmail() %>
 <%= mi.getRegisterDate() %> 
</div>
<script>
</script>
</body>
</html>