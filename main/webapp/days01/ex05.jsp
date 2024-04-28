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
                     
  </xmp>  
  정수  : <input type="text" id="num" name="num"><br> 
  <p id="demo"></p>
</div>


<script>
/* $( ":text[name=num]" ).on( "keypress", function(event) {
if( event.keycode == 13){
	  $("#demo").html("");
}
} ); */
</script>


<script>
$(function (){
   $(":text[name=num]")
     .css("text-align","center")
     .keyup(function(event) {
        
        if(event.which == 13){
           $("#demo").html("");
           
           let n = $(this).val();
           let sum = 0;
           for (var i = 1; i <= n ; i++) {
             sum += i;
             $("#demo").html(function (index, oldhtml) {
                return oldhtml + i + (i==n?"":"+");
             })
          } // for
          
          $("#demo").html(function (index, oldhtml) {
             return oldhtml + "=" + sum ;
          })
          
          $(this).select();
           
        } // if
        
     });
});

</script>
</body>
</html>