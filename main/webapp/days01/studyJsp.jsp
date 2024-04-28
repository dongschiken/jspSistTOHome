<%@page import="java.util.Date"%>
<%@page import="domain.EmpVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="domain.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection conn = DBConn.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	DeptVO d_vo = null;
	ArrayList<DeptVO> dept_list = null;
	
	String sql_dept = " SELECT deptno, dname, loc "
				      +" FROM dept";
	
	int deptno;
	String dname, loc;
	pstmt = conn.prepareStatement(sql_dept);
	rs = pstmt.executeQuery();
	
	if( rs.next() ){
		dept_list = new ArrayList<DeptVO>();

	do{
	  deptno = rs.getInt("deptno");
	  dname = rs.getString("dname");
	  loc = rs.getString("loc");
	  d_vo = new DeptVO(deptno, dname, loc);
	  
	  dept_list.add(d_vo);
	}while(rs.next());
	
	}
%>
<%
	String deptno2 = request.getParameter("deptno");
	if( deptno2 == null || deptno2.equals("")) deptno2 = "10";
	
	deptno = Integer.parseInt(deptno2);
	Connection conn2 = DBConn.getConnection();
	PreparedStatement pstmt2 = null;
	ResultSet rs2 = null;
	
	int empno;
	String ename;
	String job;
	int mgr;
	Date hiredate;
	double sal;
	double comm;
	
	ArrayList<EmpVO> e_voList = null;
	EmpVO e_vo = null;
	
	String emp_sql = " SELECT * "
			+ " FROM emp "
			+ " WHERE deptno = ? ; ";
	
	pstmt2 = conn2.prepareStatement(emp_sql);
	pstmt2.setString(1, deptno2);
	rs2 = pstmt.executeQuery();
	
	if( rs.next() ){
		e_voList = new ArrayList<EmpVO>();
		
		empno = rs.getInt("empno");
		ename = rs.getString("ename");
		job = rs.getString("job");
		mgr = rs.getInt("mgr");
		hiredate = rs.getDate("hiredate");
		sal = rs.getDouble("sal");
		comm = rs.getDouble("comm");
		
		e_vo = new EmpVO(empno, ename, job, hiredate, mgr, sal, comm, deptno);
		
		e_voList.add(e_vo);
		
		do{
			
		}while(rs.next());
		
	}
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
     <select id="deptno" name="deptno">
    <option>선택하세요.</option>   
  <%
  	Iterator<DeptVO> dept_ir = dept_list.iterator();
  	while(dept_ir.hasNext()){
  		DeptVO dvo = dept_ir.next();
  %>
  <option value="<%= dvo.getDeptno() %>"><%= dvo.getDname() %></option>
  <%
  	}
  %>
  
  <%
  %>
	</select>    
</div>
	
<script>
	
	$("#deptno").on("change", function(e){
		let value = $(this).val();
		location.href = `studyJsp.jsp?deptno=\${value}`;
	})
	
</script>
</body>
</html>