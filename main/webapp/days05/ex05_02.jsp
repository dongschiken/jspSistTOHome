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
  <form action="ex05_03.jsp" method="get">

  <table border="1" style="width:400px">
     <tr>
        <td>아이디</td>
        <td><input type="text"  name="id" value="admin"></td>
     </tr>
     <tr>
        <td>이름</td>
        <td><input type="text"  name="name"  value="관리자"></td>
     </tr>
     <tr>
        <td>비밀번호</td>
        <td><input type="password"  name="password" value="1234"></td>
     </tr>
     <tr>
        <td>이메일</td>
        <td><input type="text"  name="email" value="admin@naver.com"></td>
     </tr>
     <tr>
        <td colspan="2">
           <input type="submit">
           <input type="reset">
        </td>
     </tr>
  </table>
</form>
</div>

<script>
</script>
</body>
</html>