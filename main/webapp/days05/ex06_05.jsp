<%@page import="java.io.UnsupportedEncodingException"%>
<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
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
    http://localhost:8080/jspPro/days05/ex06_05.jsp?ckbCookie=age                 
  </xmp>  
  <form action="ex06_05_ok.jsp">
  
  <%!
  public String getCookieValue(String cname,HttpServletRequest request){
	     Cookie [] cookieArr = request.getCookies();
	     for( Cookie c : cookieArr){
	        if( c.getName().equals(cname)){
	           try{
	              return URLDecoder.decode( c.getValue() , "UTF-8");
	           }catch(UnsupportedEncodingException e){} 
	        }
	     }// for     
	     return null;
	  }
  	
  %>
  	<%
  		String[] updCookieNames = request.getParameterValues("ckbCookie");
  		for(int i = 0; i < updCookieNames.length; i++){
  			String cname = updCookieNames[i];
  			String cvalue = getCookieValue(cname, request);
  		
  	%>
  		<li>
  			<%= cname %> : <input type="text" name="<%= cname%>" value="<%= cvalue %>">
  		</li>
  	<% 
  		}
  	%>
  	<input type="submit" value="쿠키수정"/>
  </form>
</div>

<script>
</script>
</body>
</html>