<%@page import="java.util.Iterator"%>
<%@page import="domain.EmpVO"%>
<%@page import="java.util.ArrayList"%>
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
		   	<c:if test="${ empty e_voList }">
		   		<tr>
		          <td colspan="8">사원 존재 X</td>
		        </tr>
		   	</c:if>
				<c:if test="${ not empty e_voList }">
					<c:forEach items="${e_voList}" var="vo">
					<tr>
			    	  	<td><input type="checkbox" name="checkbox"></td>
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
				</c:if> 
		  </tbody>
		  <tfoot>
		    <tr>
		      <td colspan="8">
		        <span class="badge left red">
		        </span>
		        명.
		       	<button> <a href="javascript:history.back()"></a></button>	 
		       	<button id="submit">확인</button>
		      </td>
		    </tr>
		  </tfoot>
		</table>
</div>

<script>
$("#deptno").on("change", function(e){
	let value = $(this).val();
	location.href = `code.jsp?deptno=\${value}`;
});

$("#submit").on("click", function(event){
    event.preventDefault();
    var checkedEmpnos = $("[type=checkbox][name=checkbox]:checked").map(function(){
        return $(this).closest('td').next('td').text(); 
    }).get();
    let empnos = checkedEmpnos.join(", "); 
    //alert(empnos)
    location.href = `test.jsp?empnos=\${empnos}`; 
});

$(document).ready(function() {
    // 전체 선택 체크박스의 상태가 변경될 때 실행
    $('#all').on('change', function() {
        var isChecked = $(this).is(':checked'); // 전체 선택 체크박스의 상태를 확인
        $('[name="checkbox"]').prop('checked', isChecked); // 모든 체크박스의 상태를 전체 선택 체크박스와 동일하게 설정
    });

    // 개별 체크박스의 상태가 변경될 때 실행
    $('[name="checkbox"]').on('change', function() {
        if (false === $(this).is(':checked')) { // 하나라도 체크 해제된 경우
            $('#all').prop('checked', false); // 전체 선택 체크박스를 해제
        }
        // 모든 개별 체크박스가 체크된 경우
        if ($('[name="checkbox"]').length === $('[name="checkbox"]:checked').length) {
            $('#all').prop('checked', true); // 전체 선택 체크박스를 체크
        }
    });
});
</script>
</body>
</html>