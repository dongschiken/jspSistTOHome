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
      ex11.jsp
      ex11_forward.jsp
      ex11_redirect.jsp
      ex11_finish.jsp               
  </xmp>  
  
  
  <%
  	String name = "admin";
  	int age = 20;
  %>
  
 
</div>
	<a href="ex11_redirect.jsp">리다이렉트</a><br>
	<a href="ex11_forward.jsp">포워딩</a>
<script>
	$("a").on("click", function(){
		$(this).attr("href", function(i, oldHref){
			return `\${oldHref}?name=<%=name%>&age=<%= age %>`;
		});
	})
</script>
</body>
</html>