<%@page import="java.net.URLDecoder"%>
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
                     
  </xmp>  
  <form action="">
<!--모든 쿠키정보를 얻어와서 체크박스로 만들어서 출력하기
  	js document.cookie 속성 -->
  	
  	<%
  		Cookie[] cookieArr = request.getCookies();
  		for( Cookie c : cookieArr){
  			String cookieName = c.getName();
  			// 쿠키 언어올때는 디코딩 해야한다.
  			String cookieValue = URLDecoder.decode(c.getValue(), "UTF-8");
  			
  			//c.getDomain();
  			//c.getMaxAge();
  			//c.getSecure();
  			//c.getPath();
  			
    %>
    	<input type="checkbox" name="ckbCookie" value="<%= cookieName %>">
    	<%= cookieName %>-<%= cookieValue %><br>
    <% 
  		} // for
  	%>
  </form>
  
  <a href="ex06.jsp">쿠키 Home</a><br><br>
  <a href="ex06_02.jsp">쿠키 생성</a><br>
  수정,삭제할 쿠키를 체크 한 후 쿠키 수정, 삭제<br>
  <a href="ex06_04.jsp">쿠키 삭제</a><br>
  <a href="ex06_05.jsp">쿠키 수정</a><br>
</div>

<script>

$("a").on("click", function(event){
	event.preventDefault();
	let url = $(this).attr("href");
	
	// 기억하기 -> jquery에서 serialize()이걸 사용하면 이런식으로 자동적으로 만들어준다. ckbCookie=name&ckbCookie=JSESSIONID
	let queryString = $("form").serialize();
	//alert(queryString);
	location.href = `\${url}?\${queryString}`;
});

</script>
</body>
</html>