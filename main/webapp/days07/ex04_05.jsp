<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
    JSTL c(코어)
    1) 제어문 : c:if, c:choose, c:forEach, c:forTokens
    2) 변수  : c:set, c:remove      
    3) URL 처리 : c:import, c:redirect, c:url
    4) 기타  : c:catch           
  </xmp>  
   <%
  	MemberInfo member = new MemberInfo();
    member.setId("admin");
    member.setName("관리자");
  %>
  
  <c:set var="mem" value="<%= member %>"></c:set>
  member : ${ mem.id }
  member.name : ${ mem.name } 
  
  
 <%
  	String name = "홍길동";
    request.setAttribute("name", name);
  %> 
  
  <%
  	Map<String, String> map = new HashMap<>();
  	map.put("id", "admin");
  	map.put("password", "1234");
  %>
  <c:set var="map" value="<%= map %>"></c:set>
  
  
  id : ${ map.id }<br>
  passwd = ${ map.password }<br>
  
  name(표현식) <%= name %><br>
  <c:set var="name1" value="${ name }"></c:set>
  <c:set var="name2" value="홍길동"></c:set>
  <c:set var="name3" value="<%= name %>"></c:set>
  <c:set var="name4">${ name }</c:set>
  <c:set var="name5">홍길동</c:set>
  name1 : ${ name1 }<br>
  name2 : ${ name2 }<br>
  name3 : ${ name3 }<br>
  name4 : ${ name4 }<br>
  name5 : ${ name5 }<br>
  
  
</div>

<script>
</script>
</body>
</html>