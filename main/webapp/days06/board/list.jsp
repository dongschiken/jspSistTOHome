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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style>
span.material-symbols-outlined {
	vertical-align: text-bottom;
}
.class:hover{
	cursor: pointer;
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
		<xmp class="code"> list.jsp </xmp>
		<h2>목록 보기</h2>
		<a href="<%= contextPath%>/cstvsboard/write.htm">글쓰기</a>
		<select id="cmbNumberPerPage" name="cmbNumberPerPage">
	  </select>
	  <script>
	    for (var i = 10; i <= 50; i+=5) {
	     $("#cmbNumberPerPage").append(`<option>\${i}</option>`); 
	    }
	    
	    // url에서 numberPerPage라는 문자열 찾아서 그 값이 null이 아닐때만 cmbNumberPerPage에 값을 넣는다.
	    var urlParams = new URLSearchParams(location.search);
	    var numberPerPage = urlParams.get('numberPerPage');
	    if (numberPerPage) {
	        $("#cmbNumberPerPage").val(numberPerPage);
	    }
	    
	    $("#cmbNumberPerPage").on("change", function (){
	    	var selectedValue = $(this).val(); // 선택된 옵션 값
	        //alert(selectedValue);
	        location.href = `/jspPro/cstvsboard/list.htm?currentpage${pDto.currentPage}=&numberPerPage=\${selectedValue}`
	        
	    });
	    
	  </script> 
		<table>
			<thead>
				<tr>
					<th width="10%">번호</th>
					<th width="45%">제목</th>
					<th width="17%">작성자</th>
					<th width="20%">등록일</th>
					<th width="10%">조회</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${ not empty list }">
						<c:forEach items="${list }" var="dto">
							<tr>
								<td>${dto.seq }</td>
								<td class="title"><a href="<%=contextPath %>/cstvsboard/view.htm?seq=${dto.seq}">${dto.title}</a></td>
								<td>${dto.writer }</td>
								<td>${dto.writedate }</td>
								<td>${dto.readed }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">등록된 게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5" align="center">
					<div class=pagination>
						<c:if test="${ pDto.prev }">
							<a href="<%= contextPath %>/cstvsboard/list.htm?currentpage=${ pDto.start-1}">&lt;</a>
						</c:if>
						<c:forEach var="page_num" begin="${ pDto.start }" end="${ pDto.end }" step="1">
						<c:choose>
							<c:when test="${ page_num == pDto.currentPage }">
							<!-- 리스트 출력하는 페이지 갔다오지 않아도 된다.  -->
							<%-- <a class="active" href="<%= contextPath %>/cstvsboard/list.htm?currentpage=${ page_num }">${page_num}</a> --%>
							<a class="active" href="#">${page_num}</a>
							</c:when>
							<c:otherwise>
							<a href="<%= contextPath %>/cstvsboard/list.htm?currentpage=${ page_num }">${ page_num }</a>	
							</c:otherwise>
						</c:choose>						
						</c:forEach>
						<c:if test="${ pDto.next }">
						<a href="<%= contextPath %>/cstvsboard/list.htm?currentpage=${ pDto.end+1}">&gt;</a>
						</c:if>
					</div>
					<!-- [1] 2 3 4 5 6 7 8 9 10 > -->		
					</td>
				</tr>
				<tr>
					<td colspan="5" align="center">
						<form method="get">
							<select name="searchCondition" id="searchCondition">
								<option value="1">title</option>
								<option value="2">content</option>
								<option value="3">writer</option>
								<option value="4">title+content</option>	
							</select>
							<input type="text" name="searchWord" id="searchWord" />
							<input type="submit" value="search" />
						</form>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>

<script>
	// list.htm?write=sucess or fail
	if( `<%= request.getParameter("write")%>` == "success"){
		alert("글쓰기 성공!!");
	}else if(`<%= request.getParameter("write")%>` == "fail"){
		alert("글쓰기 실패!!");
	}else if(`<%= request.getParameter("delete")%>` == "success"){
		alert("게시글 삭제 완료!!");
	}
	
	// 검색어랑 검색 조건 상태 유지
	$("#searchCondition").val(${param.searchCondition});
	$("#searchWord").val("${param.searchWord}");
	
	// 검색한 후에 검색조건 검색어를 같이 보내기	
	$(".pagination a:not(.active)").attr("href"
         , function (index, oldHref){
      return `\${oldHref}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;
   });
	
	//  검색후 게시글 제목을 클릭
	$(".title a").attr("href"
	         , function (index, oldHref){
	      return `\${oldHref}&currentpage=${param.currentpage}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;
	   });
	/* http://localhost:8080/jspPro/cstvsboard/list.htm?delete=success */
</script>
</body>
</html>