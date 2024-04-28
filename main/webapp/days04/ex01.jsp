<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kenik HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
   	<li><a href="<%= contextPath %>/cstvsboard/list.htm">게시판</a></li>
   	
   	
   	
  </ul>
</header>
<h3>
  <span class="material-symbols-outlined">view_list</span> jsp days00
</h3>
<div>
  <xmp class="code">
     1. TBL_cstvsboard 게시판 테이블                
     2. SEQ_TBL_CSTVSBOARD 시퀀스
     3. board 폴더 만들기
     4. days04.board 패키지 만들기
     5. days04.board.domain 패키지 생성
     6. days04.board.domain 
     	- BoadrDTO.java     	
     7. days04.board.persistance
     	- BoardDAO
     	- BoardDAOImpl
     8. 페이징 처리
     
     게시판 목록 보기 : List.java, list.jsp
     게시판 글 쓰기  : Write.java, write.jsp
  </xmp>  
</div>

<script>
</script>
</body>
</html>