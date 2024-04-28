<%@page import="java.text.DecimalFormat"%>
<%@page import="javax.swing.text.NumberFormatter"%>
<%@page import="days07.FormatUtil"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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
    EL 객체의 메서드 호출
    EL 객체의 정적 메서드 호출                 
  </xmp>  
  
  <%
  	long price = 22345;
  	request.setAttribute("price", price);
  %>
  
  
  
  price(표현식) : <%= String .format("%,d", price) %><br>
  <!-- price를 3자리 마다 , 를 찍어서 단가를 출력 -->
  <%
  String pattern = "##,###";	
  DecimalFormat df = new DecimalFormat(pattern);
  String price_str = df.format(price);
  %>
  price : <%= price_str %><br>
  price(EL 표현식) : ${ price }<br>
  price(EL 표현식) : ${ price }<br>
  
  price(EL 표현식) : ${ FormatUtil.staticNumber(price, "#,##0") } <br> 
  
  <%
  	FormatUtil formatUtil = new FormatUtil();
  	request.setAttribute("formatUtil", formatUtil);
  %>
  price(EL 표현식) : ${ formatUtil.number(price, "#,##0") } <br>
  
  
  <hr>
  
  <!-- JSTL : JSP 표준 태그 라이브러리  
  	   C    : core 변수/제어문
  	   
  -->
  
  price(EL) : <fmt:formatNumber value="${ price }" /><br>
</div>

<script>
</script>
</body>
</html>