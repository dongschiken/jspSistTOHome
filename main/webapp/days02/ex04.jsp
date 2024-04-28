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
     [ jsp 스크립트 요소 ]
     1. 스크립트릿 - 자바 코딩
     2. 표현식	- 표현 언어와 다르다
     3. 선언문	- 변수, 메서드 선언                
  </xmp>  
  
  <%
  	// 스크립트릿
  	String name = "홍길동";
    
  %>
  (표현식)이름 : <%= name %><br>
  (표현식)나이 : <%= age %><br>
  (표현식)메서드 호출 : <%= printMessage("hello") %>
  <%!
  	// 선언문 - 변수 / 메서드 선언
  	int age = 20;
    public String printMessage(String message){
    	return "안녕"+message;
    }
  %>
  <hr>
  
  <%
     int sum = 0;
  %>
     sum 변수 선언<br>
  <%
     for(int i=1; i<=10;i++){
  %><%= i %>+<%
        sum += i;
     }    
  %>=<%= sum %>
</div>

<script>
</script>
</body>
</html>