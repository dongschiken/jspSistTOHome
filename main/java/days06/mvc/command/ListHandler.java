package days06.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.domain.PageDTO;
import days04.board.persistance.BoardDAOImpl;

public class ListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 검색 기능 + 페이징 처리
		int currentPage = 1;	// 현재 페이지 번호
		int numberPerPage = 10; // 한페이지에 출력할 게시물 수
		
	
		try {
			numberPerPage = Integer.parseInt(request.getParameter("numberPerPage"));
		} catch (Exception e){		
		}
		
		// 검색 파라미터 시작
		int searchCondition = 1;
		
		try {
			searchCondition = Integer.parseInt(request.getParameter("searchCondition")); 
		} catch (Exception e) {
			//e.printStackTrace();
		}
		
		String searchWord = request.getParameter("searchWord"); // null 이면 검색 안함
		
		
		try {
			currentPage = Integer.parseInt(request.getParameter("currentpage"));		
		} catch (Exception e) {
			//e.printStackTrace();
		}
		
		
		int numberOfPageBlock = 10; // [1] 2 3 4 5... 이렇게 표현
		int totalRecords = 0; // 총 레코드 수
		int totalPages = 0; // 총 페이지 수
		
		
		System.out.println(currentPage);
		System.out.println(numberPerPage);
		
		Connection conn = ConnectionProvider.getConnection();
		BoardDAOImpl daoImpl = new BoardDAOImpl(conn);
		ArrayList<BoardDTO> list = null;
		PageDTO pDto = null;
		
		
		try {
			if( searchWord == null || searchWord.equals("") ) {
				list = daoImpl.select(currentPage, numberPerPage);
				totalPages = daoImpl.getTotalPages(numberPerPage);
				//totalRecords = daoImpl.getTotaRecords();
				// 여기서 시작값 끝값, 몇페이지인지, 총 페이지수
			}else { // 검색버튼을 눌렀을때 
				list = daoImpl.search(searchCondition, searchWord, currentPage, numberPerPage);
				totalPages = daoImpl.getTotalPages(numberPerPage, searchCondition, searchWord);			
			} // 검색
			pDto = new PageDTO(currentPage, numberPerPage, numberOfPageBlock, totalPages);
			
			
		} catch (SQLException e) {
			System.out.println("> List.doGet()에서 Exception ");
			e.printStackTrace();
		}
		conn.close();
		
		// 1. 리스트값으로 전달
		request.setAttribute("list", list);
		request.setAttribute("pDto", pDto);
		
		return "/days06/board/list.jsp";
	}
	
	
	
}
