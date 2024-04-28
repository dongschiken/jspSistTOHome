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

//@WebServlet("/cstvsboard/edit.htm")
public class Edit extends HttpServlet {
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
		String path = "/days04/board/edit.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Long pseq = Long.parseLong(request.getParameter("seq"));
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int tag = Integer.parseInt( request.getParameter("tag") );
		
		Connection conn = DBConn.getConnection();
		BoardDAOImpl daoImpl = new BoardDAOImpl(conn);
		
		BoardDTO dto = new BoardDTO().builder()
				.seq(pseq)
				.pwd(pwd)
				.email(email)
				.title(title)
				.content(content)
				.tag(tag)
				.build();	
		
		
		int rowCount = 0;
		
		try {
			rowCount = daoImpl.update(dto);
		} catch (SQLException e) {
			System.out.println(" > Edit.doPost() 예외 발생");
			e.printStackTrace();
		}
		
		DBConn.close();
		
		// 리 다이렉팅
		// 리 다이렉팅 할때는 컨텍스트 패스부터 준다.
		String location = "/jspPro/cstvsboard/view.htm?seq="+pseq;
		location += rowCount == 1 ? "&edit=success" : "&edit=fail";
		response.sendRedirect(location);
	}

}
