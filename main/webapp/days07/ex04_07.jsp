<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    국제화 fmt
     - 틀정 지역에 따라 알맞은 메시지 출력할때
     - 주로 사용 : 숫자, 날짜 포멧팅
     fmt:formatNumber
     fmt:formatDate
     
     fmt:parseNumber
     fmt:parsDate
                      
  </xmp>  
  
  
  <%
  	long price = 22345;
  	
  %>
  <c:set var="price" value="<%= price %>"></c:set>
  price = ${ price }<br>
  <fmt:formatNumber  
  		var="fmtPrice" 
  		value="${ price }"
  		type="number"
  		pattern="##,###.00"
  		/>
  		
  price = ${ fmtPrice }<br>
  
  
    <fmt:formatNumber 
  	value="${ price }" 
  	type="currency"
  	currencySymbol="$"
  	/><br>
  	
  	<fmt:formatNumber 
  	value="${ price }" 
  	type="percent"
  	/><br>
  	
  	
  	<%
  		String strPrice = "1,200.34";
  		// String -> double 형변환
  		double dprice = Double.parseDouble(strPrice.replaceAll(",", ""));
  		
  	%>
  	dprice = <%= dprice %><br>
  	<fmt:parseNumber value="<%= strPrice %>" pattern="0,000.00" var="dprice2" />
  	dprice2 = ${ dprice2 }
  	
  	
</div>

<script>
</script>
</body>
</html>