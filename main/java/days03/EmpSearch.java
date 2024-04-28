package days03;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import domain.DeptVO;
import domain.EmpVO;


@WebServlet("/days03/empsearch.htm")
public class EmpSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public EmpSearch() {
		super();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 포워딩
		// 1.
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " SELECT deptno, dname, loc "
				+" FROM dept ";
		int deptno;
		String dname, loc;

		DeptVO vo = null;
		ArrayList<DeptVO> dlist = null;

		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if( rs.next() ){
				dlist = new ArrayList<DeptVO>();
				do{
					deptno = rs.getInt("deptno");
					dname = rs.getString("dname");
					loc = rs.getString("loc");			  
					vo = new DeptVO(deptno, dname, loc);
					dlist.add(vo);
				}while(rs.next());
			} // if
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				rs.close();
				pstmt.close();
				//DBConn.close();
			}catch(SQLException e){
				e.printStackTrace();
			} //try	  
		} // try 



		// 2.
		sql = " SELECT DISTINCT job "
				+" FROM emp "
				+" ORDER BY job ASC";
		String job;

		ArrayList<String> jobList = null;

		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if( rs.next() ){
				jobList = new ArrayList<String>();
				do{
					job = rs.getString("job");
					jobList.add(job);
				}while(rs.next());
			} // if
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				rs.close();
				pstmt.close();
				//DBConn.close();
			}catch(SQLException e){
				e.printStackTrace();
			} //try	  
		} // try

		// 3. 검색 조건 선택 후
		// days03/empsearch.htm
		// ?
		// deptno=10&deptno=30&job=ANALYST&job=MANAGER&job=PRESIDENT
		// 

		String pdeptno = null;  //"10 , 30"
		String pjob = null;  // "PRESIDENT , MANAGER"
		int empno;
		String ename;
		//String job;
		int mgr;
		Date hiredate;
		double sal;
		double comm;

		ArrayList<EmpVO> e_voList = null;
		EmpVO e_vo = null;

		 
		
		try {
			String[] pdeptnos = request.getParameterValues("deptno");
			if( pdeptnos != null) {
				pdeptno = String.join(" , ", pdeptnos);
			}
			String[] pjobs = request.getParameterValues("job");
			if( pjobs != null) {
				pjob = String.join("' , '", pjobs);
				pjob = String.format("' %s '", pjob);
			}
		} catch (Exception e) {
			System.out.println(" > EmpSearch.doGet() - [3]번처리 쿼리");
		}
		sql = " SELECT empno, ename, job, mgr, hiredate, sal, comm , deptno "
				+ "FROM emp ";	
		if( pdeptno != null) {
			sql += String.format(" WHERE deptno IN ( %s ) ", pdeptno);
		}
		if( pjob != null && pdeptno != null) {
			sql += String.format(" OR job IN ( %s ) ", pjob);
		}else if( pjob != null && pdeptno == null ) {
			sql += String.format(" WHERE job IN ( %s ) ", pjob);
		}
		sql += " ORDER BY deptno ASC ";
		System.out.println("[3] sql : " + sql);
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		} catch (SQLException e1) {	
			e1.printStackTrace();
		} catch( Exception e) {
			e.printStackTrace();
		}


		try {
			if( rs.next() ){
				e_voList = new ArrayList<EmpVO>();

				do{
					empno = rs.getInt("empno");
					ename = rs.getString("ename");
					job = rs.getString("job");
					mgr = rs.getInt("mgr");
					hiredate = rs.getDate("hiredate");
					sal = rs.getDouble("sal");
					comm = rs.getDouble("comm");
					deptno = rs.getInt("deptno");
					e_vo = new EmpVO(empno, ename, job, hiredate, mgr , sal, comm, deptno);

					e_voList.add(e_vo);
				}while(rs.next());
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			rs.close();
			pstmt.close();
			DBConn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("dlist", dlist);
		request.setAttribute("jobList", jobList);
		request.setAttribute("e_voList", e_voList);
		// 포워딩
		String path = "/days03/ex01_empsearch_jstl.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
