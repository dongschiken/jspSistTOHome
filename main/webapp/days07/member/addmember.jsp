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
<h1 class="main"><a href="#" style="position: absolute; top:30px;">dongs</a></h1>
  <ul>
  	<c:choose>
  		<c:when test="${ empty auth }">
  			<li><a href="${ pageContext.request.contextPath}/days07/member/logon.jsp">로그인</a></li>
  		</c:when>
  		<c:otherwise>
  			<li><a href="${ pageContext.request.contextPath}/days07/member/logout.jsp">${ auth }님 로그아웃</a></li>
  		</c:otherwise>
  	</c:choose>
  	
  	<li><a href="${ pageContext.request.contextPath}/days07/member/addmember.jsp"></a></li>
  </ul>
</header>
<h3>
  <span class="material-symbols-outlined"></span> jsp days00
</h3>
<div>
  <xmp class="code">
                     
  </xmp> 
  <h2>회원가입</h2> 
</div>

<script>
</script>
</body>
</html>