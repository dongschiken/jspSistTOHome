<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
      c:forEach
      	- items		: 반복 배열, 대상 객체(Map, 컬렉션)
      	- var		: 변수명
      	- begin		: 반복 시작값
      	- end		: 반복 끝값
      	- step		: 반복 증가치
      	- varStatus :     
  </xmp>  
  <!-- 1+2+3+...+9+10=55 -->
  <c:forEach begin="1" end="10" step="1" var="i">
  <c:set var="sum" value="${sum + i}" />
  <c:set var="gugu" value="${ gugu * i }"></c:set>
  <c:choose>
   	 
	  <c:when test="${ i eq 10 }">${ i } = ${ sum }</c:when>
	  <c:otherwise> ${ i } +</c:otherwise>
	 
  </c:choose>
  </c:forEach>
  
  <c:forEach begin="1" end="10" step="1" var="i2">
  <c:set var="sum" value="${sum + i}" />
  	${ i += (i eq 10 ? "" : "+") }
  </c:forEach>
  
  <c:forEach begin="1" end="10" step="1" var="i2">
  <c:set var="sum" value="${sum + i}" />
  	${ i += (i eq 10 ? "" : "+") }
  </c:forEach>
  <br>
  
  <br>
  <c:forEach begin="5" end="13" step="2" var="1" varStatus="status">
  	${ i } 
  	- ${ status.index } 
  	- ${ status.count } 
  	- ${ status.first } 
  	- ${ status.last }<br>
  </c:forEach>
   
  <c:forEach begin="2" end="9" step="1" var="i3">
  <c:set var="dan" value="${ i3 }" />
  <c:set var="gugu" value="${ i3+1}" />
  <c:set var="gugudan" value="${ gugu * i3 }"></c:set>
  <c:choose>
  <c:when test="i3">${ dan } * ${ gugu } = ${ gugudan }</c:when>	
  </c:choose>
  </c:forEach>
  
  
  
  <%
  	int[] m = { 3, 5, 2, 4, 1 };
  %>
  <c:set var="arr" value="<%= m %>"></c:set>
  <c:forEach var="n" items="<%= m %>" varStatus="s">
  	<li>m[${ s.index }] = ${ n }</li>
  </c:forEach>
  
  
  <c:set var="names" value="홍길동,김길동,박길동"></c:set>
  <c:forTokens items="${ names }" delims="," var="name">
  	${ name }<br>
  </c:forTokens>
  
  <!-- Map + c:forEach -->
  <%
    Map<String, String> map = new HashMap<>();
    map.put("id","admin");  // entry
    map.put("name","관리자");
    map.put("age","20");
  %>
  
  <c:set var="map" value="<%= map %>"></c:set>
  <c:forEach items="${ map }" var="entry">
  	<li> ${ entry.key } - ${ entry.value } </li>
  </c:forEach>

 <%
 	String msg = "<h3>Hello World</h3><hr>홍길동<hr>";
 	request.setAttribute("msg", msg);
 %>
 <p id="demo">${ msg }</p>
 
 <c:out value="<%= msg %>"></c:out><br>
 
 <c:out value="${ msg }"></c:out><br>
 <c:out value="${ msg }" escapeXml="true"></c:out>
</div>

<script>
</script>
</body>
</html>