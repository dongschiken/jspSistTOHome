<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = request.getParameter("name");
	String age  = request.getParameter("age");
%>
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
                     
  </xmp>  
  <form action="ex02_03.jsp" method="get">
    address : <input type="text" name="address" value="서울 역삼동"><br>
    tel : <input type="text" name="tel" value="010-1111-2222"><br>
    <input type="button" value="Prev" onclick="history.back();">
    <input type="submit" value="Next">
<%--  	<input type="hidden" name="name" value="<%=name %>">
 	<input type="hidden" name="age" value="<%=age%>"> --%>
 	
 	
  </form>
</div>



<script>
	let content;
	
	
	<%
		Enumeration<String> en = request.getParameterNames();
		while(en.hasMoreElements()){
			String pname = en.nextElement();
			String pvalue = request.getParameter(pname);
	%>
			content = `<input type="hidden" name="<%= pname %>" value="<%=pvalue %>">`
			$("form").append(content);
	<%
		}
	%>
	
	

</script>
</body>
</html>