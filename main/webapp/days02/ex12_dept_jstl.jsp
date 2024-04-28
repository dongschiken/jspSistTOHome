<%@page import="java.util.ArrayList"%>
<%@page import="domain.DeptVO"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
     ex12_dept.jsp에서 
     부서 옵션을 하나 선택하면      
     -> /scott/emp?deptno=10 요청 URL -> /scott/emp -> 서블릿 클래스 ScottEmp.java 
     -> 사원정보를 담아서 ex12_emp.jsp페이지로 포워딩 시키고         
  </xmp>  
     <select id="deptno" name="deptno">    
    <option>선택하세요.</option>    

	<!-- 서블릿에서 request.setAttribute에서 설정한 list 라는 이름으로 바로 사용가능하다. -->
	<c:forEach items="${list}" var="vo">
	<option value=`${vo.deptno}`>${vo.dname}</option>
	</c:forEach>
    
   </select>   
</div>

<script>
$("#deptno").wrap("<form></form>")
	.change(function(event){
		$(this).parent()
			.attr({
				method: "get",
				action: "/jspPro/scottemp"
			})
			.submit();	
	});

</script>
</body>
</html>