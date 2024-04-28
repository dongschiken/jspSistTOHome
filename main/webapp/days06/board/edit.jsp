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
<link rel="stylesheet" href="/jspPro/resourcesC/cdn-main/example.css">
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
     edit.jsp            
     글 수정할때 적용 비적용이 안된다.
     수정할때 조회수 증가를 안올리고 싶은데 view쪽으로 요청해서 조회수가 올라간다.    
  </xmp>  
  <h2>글 수정 하기</h2>
  <!-- post 방식으로 java 서버에 요청  -->
     <form method="post">
   <table>
      <tr>
         <td colspan="2" align="center"><b>글을 수정합니다.</b></td>
      </tr>
      <tr>
         <td align="center">이름</td>
         <td><input type="text" name="writer" size="15"
            disabled="disabled" value="${ dto.writer }"></td> <!-- 작성자는 수정되면 안된다. -->
      </tr>
      <tr>
         <td align="center">비밀번호</td>
         <td><input type="password" name="pwd" size="15"
            required="required"></td>
      </tr>
      <tr>
         <td align="center">Email</td>
         <td><input type="email" name="email" size="50"
         value="${ dto.email }"></td>
      </tr>
      <tr>
         <td align="center">제목</td>
         <td><input type="text" name="title" size="50"
            value="${ dto.title }"></td>
      </tr>
      <tr>
         <td align="center">내용</td>
         <td><textarea name="content" cols="50" rows="10">${ dto.content }</textarea></td>
      </tr>
      <tr>
         <td align="center">HTML</td>
         
         <td>
         	${ dto.tag }
             <input type="radio" name="tag" value="1" checked>적용
         	 <input type="radio" name="tag" value="0">비적용
         	 <script>
/*          	 	$(":radio[name=tag]").each(function(i , e){
         	 		if( e.value == ${dto.tag}) e.checked = true;
         	 	}); */
         	 	$(":radio[name=tag][value=${dto.tag}]").attr("checked", "true");
         	 </script>
         </td>
      </tr>
      <tr>   
         <td colspan="2" align="center">
            <input type="submit"   value="작성 완료"> 
          		&nbsp;&nbsp;&nbsp; 
           <a href="javascript:history.back();">이전으로</a>
         </td>
      </tr>
   </table>
  </form>
</div>

<script>
</script>
</body>
</html>