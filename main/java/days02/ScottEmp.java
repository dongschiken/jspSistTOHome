package days02;

import java.io.IOException;
import java.net.URLEncoder;
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

import domain.EmpVO;


@WebServlet("/scottemp")
public class ScottEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ScottEmp() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String deptno2 = request.getParameter("deptno").replace("`", "");
		//String encodedValue = URLEncoder.encode(request.getParameter("deptno"), "UTF-8") ;
		if( deptno2 == null || deptno2.equals("")) deptno2 = "10";
		
		int deptno = Integer.parseInt(deptno2);
		Connection conn = DBConn.getConnection();
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
				+ " WHERE deptno = ? ";
				
		try {
			pstmt2 = conn.prepareStatement(emp_sql);
			pstmt2.setInt(1, deptno);
			rs2 = pstmt2.executeQuery();
		} catch (SQLException e1) {	
			e1.printStackTrace();
		} catch( Exception e) {
			e.printStackTrace();
		}
		
		
		try {
			if( rs2.next() ){
				e_voList = new ArrayList<EmpVO>();
				
				do{
					empno = rs2.getInt("empno");
					ename = rs2.getString("ename");
					job = rs2.getString("job");
					mgr = rs2.getInt("mgr");
					hiredate = rs2.getDate("hiredate");
					sal = rs2.getDouble("sal");
					comm = rs2.getDouble("comm");
					
					e_vo = new EmpVO(empno, ename, job, hiredate, mgr , sal, comm, deptno);
					
					e_voList.add(e_vo);
				}while(rs2.next());
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			rs2.close();
			pstmt2.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("e_voList", e_voList);
		String path = "/days02/ex12_emp_jstl.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
