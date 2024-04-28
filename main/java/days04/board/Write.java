package days04.board;

import java.io.IOException;
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

//@WebServlet("/cstvsboard/write.htm")
public class Write extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Write() {
		super();
	}

	// 게시판 글 쓰기 페이지로 포워딩 - get 요청일때
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		// 2. 포워딩
		String path = "/days04/board/write.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String writer = request.getParameter("writer");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int tag = Integer.parseInt( request.getParameter("tag") );
		
		Connection conn = DBConn.getConnection();
		BoardDAOImpl daoImpl = new BoardDAOImpl(conn);
		
		BoardDTO dto = new BoardDTO(0, writer, pwd, email, title, null, 0, tag, content);
		int rowCount = 0;
		
		try {
			rowCount = daoImpl.insert(dto);
		} catch (SQLException e) {
			System.out.println(" > Write.doPost() 예외 발생");
			e.printStackTrace();
		}
		
		DBConn.close();
		
		// 리 다이렉팅
		// 리 다이렉팅 할때는 컨텍스트 패스부터 준다.
		String location = "/jspPro/cstvsboard/list.htm";
		location += rowCount == 1 ? "?write=success" : "write=fail";
		response.sendRedirect(location);
	}

}
