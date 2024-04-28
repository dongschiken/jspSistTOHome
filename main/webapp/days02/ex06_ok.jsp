
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Arrays"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  <%
  	String name = request.getParameter("name");
  
  	String gender = request.getParameter("gender");
  	
  	// ? 뒤에 여러 파라미터가 넘어오면
  			
   String[] pets = request.getParameterValues("pet");
   	
  %>
  > 이름 : <%= name %><br>
  > 이름(EL사용) : ${ param.name }<br>
  > 성별 : <%= gender.equals("m") ? "남자" : "여자" %><br>
  > 좋아하는 동물 :
  <%=
  	Arrays.toString(pets)
  %>
  <h3>모든 파라미터명 조회</h3>
  <%
  	Enumeration<String> en = request.getParameterNames();
  	while(en.hasMoreElements()){
  		String parmeterName = en.nextElement();
  %>
  <li><%= parmeterName %></li>
  <% 		
  	}
  %>
</div>

<script>
</script>
</body>
</html>