package days04.board;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistance.BoardDAOImpl;

//@WebServlet("/cstvsboard/delete.htm")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 검색 기능 + 페이징 처리
		// edit.htm?seq=154
		long pseq = Long.parseLong(request.getParameter("seq"));
		
		
		// [ 해당 글번호의 내용 가져오기 ]
		Connection conn = DBConn.getConnection();
		BoardDAOImpl daoImpl = new BoardDAOImpl(conn);
		BoardDTO dto = null;
		
		try {
			dto = daoImpl.view(pseq);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(" > Edit.doGet()에서 예외 발생 ");
		}
		
		DBConn.close();
		
		// 1. 리스트값으로 전달
		request.setAttribute("dto", dto);
		
		// 2. 포워딩
		String path = "/days04/board/delete.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Long pseq = Long.parseLong(request.getParameter("seq"));
		String ppwd = request.getParameter("pwd");
		
		//System.out.print(request.getParameter("pwd"));
		String origin_pwd;
		Connection conn = DBConn.getConnection();
		BoardDAOImpl daoImpl = new BoardDAOImpl(conn);
		BoardDTO dto = new BoardDTO();
		String location = "/jspPro/cstvsboard";
		origin_pwd = dto.getPwd();
		String currentPage = request.getParameter("currentpage");
		String searchCondition = request.getParameter("searchCondition");
		String searchWord = request.getParameter("searchWord");
		
		//fn = URLEncoder.encode(file_name, "utf-8");
		// 게시글 삭제하다가 비밀번호 3번 틀리면 게시글 접근 못하게 막기
		try {
			origin_pwd = daoImpl.getOriginalPwd(pseq);
			if( origin_pwd.equals(ppwd)) {
				int rowCount = daoImpl.delete(pseq);
				
				location +="/list.htm?&currentpage="+currentPage+"&searchCondition="+searchCondition+"&searchWord="+URLEncoder.encode(searchWord, "UTF-8");
				location +="&delete=success";
			}else if( !origin_pwd.equals(ppwd)){
//				location +="/delete.htm?seq="+pseq + "&delete=fail";
				location += "/view.htm?seq="+pseq + "&delete=fail";
			}
		} catch (SQLException e) {
			System.out.println(" > Edit.deletePost() 예외 발생");
			e.printStackTrace();
		}
		
		DBConn.close();
		
		// 리 다이렉팅
		// 리 다이렉팅 할때는 컨텍스트 패스부터 준다.
		response.sendRedirect(location);
	}
}
