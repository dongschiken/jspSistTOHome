<%@page import="java.io.BufferedReader"%>
<%@page import="org.apache.coyote.http11.filters.BufferedInputFilter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
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
 .demo{
 	border: 1px solid gray;
 	padding: 5px;
 	margin-top: 10px;
 	max-heigth: 500px;
 	overflow: auto;
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
      /days05 폴더 안에 있는 모든 파일의 목록을 가져와서
      파일명을 <select></select> 추가
      select 하나의 자바파일을 선택하면
      그 선택된 파일의 내용을 출력               
  </xmp>  
  <%
  	String path = application.getInitParameter("filepath");
  	
  	// 웹 애플리케이션을 배포했을때 실제 물리적 경로 ?? ( 암기 ) 이 폴더로 배포가 이루어진다.
  	// C:\E\Class\Workspace\JspClass\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jspPro\
  	// C:\E\Class\Workspace\JspClass\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jspPro\days05
  	
  	String realPath = application.getRealPath(path);
  	
  	File dir = new File(realPath);
    
  	File[] listFiles = dir.listFiles();
  %>
  <form action="">
  	<h3>days05</h3>
   	<select name="file" id="file">
   		<%
   			for( int i = 0; i < listFiles.length; i++ ){
   				if(listFiles[i].isFile()){
   					String javaName = listFiles[i].getName();
   			%>
   				<option><%= javaName %></option>
   			<% 
   				}
   			}
   		%>
   	</select>
  </form>
  <script>
    
	var urlParams = new URLSearchParams(location.search);
	var fileNum = urlParams.get('file');
	if (fileNum) {
	     $("#file").val(fileNum);
	}

  
  	$("#file").on("change", function(){
  		let fileVal = $(this).val();
  		location.href = `/file.htm?file=`+fileVal;
  	});
  	
  	
  </script>
  
  <%
  	String fName = request.getParameter("file");
    String fname = listFiles[3].getName();
    fname = fName == null ? listFiles[0].getName() : fName;
    String fileName = String.format("%s\\%s", realPath, fname);
    String content = null;
  	try (FileReader fr = new FileReader(fileName)){
  		BufferedReader br = new BufferedReader(fr);
  		String line = null;
  		while( (line = br.readLine()) != null ){
  			line += "<\r\n>";
  			line = line.replaceAll("<", "&lt;")
  				.replaceAll(">", "&gt;")
  				.replaceAll("\r\n", "<br>");
  			
  			content += line;
  		} // while
  	}catch( Exception e ){
  		
  	}finally{
  		
  	}
  
  %>
  <div><%= content %></div>
 	<div class="demo">
 	
 	<code>
 		
 	</code>
 	
 	</div>
  
</div>

<script>
</script>
</body>
</html>