<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 여기는 로그인 처리만 하는 페이지
	String location = "";
	
	String id = request.getParameter("id");
	String password = request.getParameter("passwd");
	
	if( id.equals("admin") && password.equals("1234")){
		location = "ex09_main.jsp";
		// 인증된 계정 저장 - (DB INSERT / 쿠키 / 세션) 등등 사용
	}else if( id.equals("hong") && password.equals("1234") ){
		location = "ex09_main.jsp";
		// 인증된 계정 저장   
	}else{
		location = "ex09.jsp?error";
	}
	
	// 페이지 다른곳으로 보내는 작업
	// 방향을 바꿔서 보낸다.
	// Dispatcher 발송담당자, 보내는사람
	//response.sendRedirect(location);
	String path = location;
	RequestDispatcher dispatcher = request.getRequestDispatcher(path);
	dispatcher.forward(request, response);
	
	
%>