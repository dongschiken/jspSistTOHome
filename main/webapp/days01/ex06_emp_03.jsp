<%@page import="java.util.Arrays"%>
<%@page import="domain.EmpVO"%>
<%@page import="java.util.Date"%>
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
  String[] pdeptnos = request.getParameterValues("pdeptno");
  Connection conn = DBConn.getConnection();
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  String pdeptno = "";
  for(int i = 0 ; i < pdeptnos.length; i++){
	  pdeptno += pdeptnos[i]+", ";
  }
  pdeptno = pdeptno.substring(0, pdeptno.length()-2);
  String sql = " SELECT empno, ename, job, mgr, to_char(hiredate, 'yyyy-mm-dd') hiredate, sal, comm, deptno "
		      +" FROM emp "
		      +" WHERE deptno IN ( " + pdeptno + " ) "
		      +" ORDER BY deptno ASC ";
	 int empno;
	 String ename;
	 String job;
	 Date hiredate;
	 int mgr;
	 double sal;
	 double comm;
	 int deptno;

  EmpVO emp_vo = null;
  ArrayList<EmpVO> list = null;
  
  try{
	  pstmt = conn.prepareStatement(sql);
	  rs = pstmt.executeQuery();
	  if( rs.next() ){
		  list = new ArrayList<EmpVO>();
		  do{
			  empno = rs.getInt("empno");
			  ename = rs.getString("ename");
			  job   = rs.getString("job");
			  hiredate = rs.getDate("hiredate");
			  mgr     = rs.getInt("mgr");
			  sal   = rs.getDouble("sal");
			  comm = rs.getDouble("comm");
			  deptno = rs.getInt("deptno");
			  emp_vo = new EmpVO(empno, ename, job, hiredate, mgr, sal, comm, deptno);
			  list.add(emp_vo);
		  }while(rs.next());
	  } // if
  }catch(Exception e){
	  e.printStackTrace();
  }finally{
	  try{
		  pstmt.close();
		  rs.close();
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
  			<td>empno</td>
  			<td>ename</td>
  			<td>job</td>
  			<td>hiredate</td>
  			<td>mgr</td>
  			<td>sal</td>
  			<td>comm</td>
  			<td>deptno</td>
  		</tr>
  	</thead>
  	<tbody>
  		<%
  			if( list == null ){
  				
  		%>
  			<tr>
  				<td colspan="8">사원 존재 x</td>
  			</tr>
  		<%
  			}else{
  				EmpVO vo = null;
  				Iterator<EmpVO> ir = list.iterator();
  				
  				while(ir.hasNext()){
  				vo = ir.next();	
  				
  		%>
  		  <tr>
  			<td><%= vo.getEmpno() %></td>
  			<td><%= vo.getEname() %></td>
  			<td><%= vo.getJob() %></td>
  			<td><%= vo.getHiredate() %></td>
  			<td><%= vo.getMgr() %></td>
  			<td><%= vo.getSal() %></td>
  			<td><%= vo.getComm() %></td>
  			<td><%= vo.getDeptno() %></td>
  		</tr>
  			<%
  			}
  			%>
  		<% 	
  		}
  		%>
  	</tbody>
  	<tfoot>
  	<tr>
  		<td colspan="8">
  			<span class="badge left red">
  				<%= list==null ? 0 : list.size() %>
  			</span>
  			명.
  			<a href="javascript:history.back()">뒤로가기</a>
  		</td>
  	</tr>
  	</tfoot>
  </table>
</div>

<script>
</script>
</body>
</html>