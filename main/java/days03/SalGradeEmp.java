package days03;

import java.io.IOException;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import domain.DeptEmpSalgradeVO;
import domain.SalgradeVO;


@WebServlet("/days03/salgradeemp.htm")
public class SalGradeEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public SalGradeEmp() {
		super();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// jdbc days03.Ex03.java 메인함수
		String sql = "SELECT grade, losal, hisal "
				+ " , COUNT (*) cnt "
				+ " FROM salgrade s JOIN emp e ON e.sal BETWEEN s.losal AND s.hisal"
				+ " GROUP BY grade, losal, hisal"
				+ " ORDER BY grade";
		
		String empSql = " SELECT d.deptno, dname, empno, ename, sal, grade "
				+ " FROM dept d RIGHT JOIN emp e ON d.deptno = e.deptno "
				+ "                  JOIN salgrade s ON e.sal BETWEEN losal AND hisal "
				+ " WHERE grade = ? ";


		Connection conn = null;
		PreparedStatement pstmt = null, empPstmt = null;
		ResultSet rs = null, empRs = null;
		SalgradeVO vo = null;
		ArrayList<DeptEmpSalgradeVO> emplist = null;
		LinkedHashMap<SalgradeVO, ArrayList<DeptEmpSalgradeVO>> map = new LinkedHashMap<SalgradeVO, ArrayList<DeptEmpSalgradeVO>>();

		DeptEmpSalgradeVO empvo = null;
		conn = DBConn.getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {

				do {
					int grade = rs.getInt("grade");

					vo = new SalgradeVO(
							grade
							,rs.getInt("losal")
							,rs.getInt("hisal")
							,rs.getInt("cnt")
							);
					empPstmt = conn.prepareStatement(empSql);
					empPstmt.setInt(1, grade);
					empRs = empPstmt.executeQuery();

					if( empRs.next()) {
						emplist = new ArrayList();
						do {
							empvo = DeptEmpSalgradeVO.
									builder().
									empno(empRs.getInt("empno")).
									dname(empRs.getString("dname")).
									ename(empRs.getString("ename")).
									pay(empRs.getDouble("sal")).
									deptno(empRs.getInt("deptno")).
									build();
							emplist.add(empvo);
						} while (empRs.next());
					}

					map.put(vo, emplist);

					empRs.close();
					empPstmt.close();
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				//rs.close();
				//pstmt.close();
				conn.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		// request 영역
		request.setAttribute("map", map);
		
		String path = "/days03/ex03_salgradeemp.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
