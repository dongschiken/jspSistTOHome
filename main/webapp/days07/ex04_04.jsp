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
     ex04.04.jsp?num=10
     짝수, 홀수                
  </xmp>  
  <c:set var="pnum" value="${ param.num }" />
  <c:if test="${ pnum eq null }">null</c:if>
  <c:if test="${ pnum mod 2 eq 0}">짝수</c:if>
  <c:if test="${ pnum mod 2 ne 0 }">홀수</c:if>
  
  
  <hr>
  
  <c:choose>
  	<c:when test="${ pnum eq null }">null</c:when>
  	<c:when test="${ pnum mod 2 eq 0 }">짝수</c:when>
  	<c:otherwise>홀수</c:otherwise>
  </c:choose>
  
  <c:forTokens items="${ param.num }" delims=" "></c:forTokens>
</div>

<script>
</script>
</body>
</html>