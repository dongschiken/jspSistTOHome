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

//@WebServlet("/cstvsboard/view.htm")
public class View extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 검색 기능 + 페이징 처리
		// 글 목록보기에서 제목을 클릭해서 상세보기 seq= 일때는 조회수 증가
		// 수정하기에서 들어오면 seq= & edit= 일때는 조회수 증가 x
		// view.htm?seq=154
		long pseq = Long.parseLong(request.getParameter("seq"));
		
		
		Connection conn = DBConn.getConnection();
		BoardDAOImpl daoImpl = new BoardDAOImpl(conn);
		BoardDTO dto = null;
		
		try {
			if( request.getParameter("edit") == null) {
				daoImpl.increaseReaded(pseq);
			}
			dto = daoImpl.view(pseq);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(" > View.doGet()에서 예외 발생 ");
		}
		
		DBConn.close();
		
		// 1. 리스트값으로 전달
		request.setAttribute("dto", dto);
		
		// 2. 포워딩
		String path = "/days04/board/view.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
