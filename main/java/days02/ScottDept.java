package days02;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import domain.DeptVO;


@WebServlet("/scottdept")
public class ScottDept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ScottDept() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  response.setContentType("text/html; charset=UTF-8");
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
				  list = new ArrayList<DeptVO>();
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
		  
		  
		  request.setAttribute("list", list);
		  
		  // 포워딩 시킨다.
		  // 서버에서부터 시작한다.
		  //String path = "/days02/ex12_dept.jsp";
		  String path = "/days02/ex12_dept_jstl.jsp";
		  RequestDispatcher dispatcher =  request.getRequestDispatcher(path);
		  dispatcher.forward(request, response);
		  
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
