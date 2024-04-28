<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	
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
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>
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
  	1. JSP
     	get 방식 요청
     	post 방식 요청
     2. 서블릿
        get 방식 요청 - doGet()
        post 방식 요청 - doPost()
     실습 예) 
     	- Info.java 서블릿 클래스 선언
     	- /days02/info.htm URL 매핑
         
  </xmp>
  
  <div id="tabs">
  <ul>
    <li><a href="#tabs-1">get 방식 요청</a></li>
    <li><a href="#tabs-2">post 방식 요청</a></li>
  </ul>
  <div id="tabs-1">
    <p>
      1. 웹 브라우저 : 주소창 URL 입력 후 요청<br>
      2. a 링크 태그<br>
      3. location.href<br>
      4. form method="get"<br>
      <input type="text" id="n" name="n" value="10" /><br>
      <a href="ex03.jsp">ex03.jsp</a>
    </p>
  </div>
  <div id="tabs-2">
  		<form>
            Name : <input type="text" id="name" name="name" value="홍길동"><br>
            Age : <input type="text" id="age" name="age" value="20"><br>      
            
            <input type="radio" name="method" value="get" checked="checked">GET 요청
            <input type="radio" name="method" value="post" >POST 요청
            <br> 
            <button type="button">전송(submit)</button>
   		</form>      
  </div>
 </div>
</div>  


<script>
	
 	$("#tabs-1 a").on("click", function(){
 		/*let value = $("#n").val();
		let oldHref = $(this).attr("href");
		let newHref = `\${oldHref}?n=\${value}`;
		$(this).attr("href", newHref);
		 */
		$(this).attr("href", function(i, oldHref){
			value = $("#n").val();
			return "ex03.jsp" + `?n=\${value}`;
		});
	}) ;
	
 	$("#tabs-2 button").on("click", function(){
 		//alert(<%= contextPath%>);
 		let rdoval = $("[type=radio][name=method]:checked").val(); // get // post
 		$(this).parent() // form
 				.attr("method", rdoval)
 				.attr("action", `<%= contextPath %>/days02/info.htm`)
 				
 	<%-- 			.attr("action", `<%= contextPath %>/days02/ex03_ok_02.jsp`)
 					.attr({
 					"method":method,
 					"action":`<%= contextPath %>/days02/ex03_ok_02.jsp`
 				}) --%>
 				.submit();
 	}) ;
</script>
</body>
</html>