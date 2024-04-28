<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath(); //  "/jspPro"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style>
span.material-symbols-outlined {
	vertical-align: text-bottom;
}
</style>
</head>
<body>
	<header>
		<h1 class="main">
			<a href="#" style="position: absolute; top: 30px;">kenik HOme</a>
		</h1>
		<ul>
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
		</ul>
	</header>
	<h3>
		<span class="material-symbols-outlined">view_list</span> jsp days00
	</h3>
	<div>
		<xmp class="code"> </xmp>

		<form action="<%= contextPath %>/days03/empsearch.htm">
			<fieldset>
				<legend>부서선택</legend>
				<c:forEach items="${ dlist }" var="vo">
					<input type="checkbox" id="deptno-${vo.deptno}" name="deptno"
						value="${vo.deptno}">
					<label for="deptno-${vo.deptno}">${vo.dname}</label>
				</c:forEach>
			</fieldset>
			<fieldset>
				<legend>잡 선택</legend>
				<c:forEach items="${ jobList }" var="job">
					<input type="checkbox" id="${job}" name="job" value="${job}">
					<label for="${job}">${job}</label>
				</c:forEach>
			</fieldset>
		<input type="submit" value="search" >
		<input type="button"value="emp delete">
		</form>
	
	

		<h2>emp list</h2>
		<table>
			<thead>
				<tr>
					<td><input id="all" type="checkbox">전체선택</td>
					<td>empno</td>
					<td>ename</td>
					<td>job</td>
					<td>mgr</td>
					<td>hiredate</td>
					<td>sal</td>
					<td>comm</td>
					<td>deptno</td>
				</tr>
			</thead>
			<tbody>
				<%-- <c:if test="${list == null}"> --%>
				<c:choose>
					<c:when test="${ empty e_voList }">
						<tr>

							<td colspan="8">사원 존재 X</td>
						<tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${e_voList}" var="vo">
							<tr>
								<td><input type="checkbox" data-empno="${ vo.empno }" value="${ vo.empno }"></td>
								<td>${vo.empno}</td>
								<td>${vo.ename}</td>
								<td>${vo.job}</td>
								<td>${vo.hiredate}</td>
								<td>${vo.mgr}</td>
								<td>${vo.sal}</td>
								<td>${vo.comm}</td>
								<td>${vo.deptno}</td>
							</tr>
						</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="9"><span class="badge left red"> ${ empty e_voList  ?  0 : e_voList.size() }</span> 명.
						<button>
							<a href="javascript:history.back()"></a>
						</button>
				</tr>
			</tfoot>
			</c:otherwise>
			</c:choose>
			



		</table>
	</div>

<script>
	
	let url = location.href;
	
	if( url.indexOf("deptno=") != -1 ){
		$(":checkbox[name=deptno]").each( function(i, element ){
			
			let v = $(element:checked).val();
			// deptno=10
			if( url.indexOf(`deptno=$\{v}` != -1 )){
				alert(`deptno=\${v}`);
				$(element).prop("checked", true);
			} 
		} ) ;
	}
	
	
	if( url.indexOf("job=") != -1 ){
		$(":checkbox[name=job]").each( function(i, element ){
			let d = $(element).val();
			// deptno=10
			if( url.indexOf(`job=\${d}` != -1 )){
				$(element).prop("checked", true);
			} 
		} ) ;
	}

</script>
</body>
</html>