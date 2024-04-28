<%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.DeptVO"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="com.util.DBConn"%>
<%@ page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  Connection conn = DBConn.getConnection();
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  String sql = " SELECT deptno, dname, loc "
		      +" FROM dept ";
  int deptno;
  String dname, loc;
  
  DeptVO vo = null;
  ArrayList<DeptVO> list = null;
  
  try{
	  pstmt = conn.prepareStatement(sql);
	  rs = pstmt.executeQuery();
	  if( rs.next() ){
		  list = new ArrayList<>();
		  do{
			  deptno = rs.getInt("deptno");
			  dname = rs.getString("dname");
			  loc = rs.getString("loc");			  
			  vo = new DeptVO(deptno, dname, loc);
			  list.add(vo);
		  }while(rs.next());
	  } // if
  }catch(Exception e){
	  e.printStackTrace();
  }finally{
	  try{
		  rs.close();
		  pstmt.close();
		  DBConn.close();
	  }catch(SQLException e){
		  e.printStackTrace();
	  } //try	  
  } // try 
  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="/jspPro/resources/cdn-main/example.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


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
  <h2>Checkbox</h2>
  <fieldset id="dept">
    <legend>dept check: </legend>
<!--     <label for="checkbox-1">2 Star</label>
    <input type="checkbox" name="checkbox-1" id="checkbox-1">
    <label for="checkbox-2">3 Star</label>
    <input type="checkbox" name="checkbox-2" id="checkbox-2">
    <label for="checkbox-3">4 Star</label>
    <input type="checkbox" name="checkbox-3" id="checkbox-3">
    <label for="checkbox-4">5 Star</label>
    <input type="checkbox" name="checkbox-4" id="checkbox-4"> -->
    <%
    	Iterator<DeptVO> ir = list.iterator();
    	while(ir.hasNext()){
    		
    		vo = ir.next();
    %>
     <label for="deptno-<%= vo.getDeptno()%>"><%= vo.getDname()%></label>
     <input type="checkbox" value="<%= vo.getDeptno()%>" name="deptno" id="deptno-<%= vo.getDeptno()%>">
    
    <% 
    	}
    %>
  </fieldset>
  <button type="submit" id="submit"></button>
</div>

<script>
$( function() {
    $( "#dept :checkbox" ).checkboxradio();
  });
let checks = $("[type=checkbox]");
$("#submit").on("click", function(){
    checks.each(function() { // jQuery의 each() 메서드를 사용해 각 체크박스를 순회
        if ($(this).is(":checked")) { // this는 현재 체크박스를 가리킴
            let deptno = $(this).val();
    		location.href = `ex06_emp.jsp?deptno=\${deptno}`;
        }
    });
});
</script>
</body>
</html>