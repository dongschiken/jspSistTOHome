<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//int num = request.getParameter("num");
	
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
  </ul>
</header>
<h3>
  <span class="material-symbols-outlined">view_list</span> jsp days00
</h3>
<div>
  <xmp class="code">
                     
  </xmp>  
  정수  : <input type="text" id="num" name="num">
  <br> 
  <p id="demo">
  <%
  	// ex05_02.jsp에서 아무것도 넣지 않고 들어오면 null이 들어온다.
  	// ex05_02.jsp?num=enter 만약 그냥 엔터를 치면 ""이 들어온다.
  	String num = request.getParameter("num");
    int n, sum = 0;
    if( num != null && !num.trim().equals("")){
    	n = Integer.parseInt(num);
    	for(int i = 1; i <= n; i++){
    		
    	%>
    	<%= i
    		
    	%>+	
    	<%
    		sum += i;
    	}
    	%>
    	=
    	<%= sum
    	
    	%>
    	<%
    
    	%>
    	<%
    	}
    	%>
    

  
  </p>
</div>


<script>
/* $( ":text[name=num]" ).on( "keypress", function(event) {
if( event.keycode == 13){
	  $("#demo").html("");
}
});  */

$(function (){
	   $(":text[name=num]")
	     .css("text-align","center").val('${param.num}')
	     .keyup(function(event) {
	        if(event.which == 13){
	          let num = $(this).val();
	          // location.href를 사용해서 submit과 같은 효과를 준다.
	          location.href = `ex05_02.jsp?num=\${num}`
	        } // if 
	     });
	     //.select();
	});

</script>

</body>
</html>