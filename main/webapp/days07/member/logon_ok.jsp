<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	// DB 처리 : id/passwd 체크 - 로그인 성공 / 실패
	
	
	// 로그인 성공 AuthInfo.java // 야이디 / 권한정보 등등
	session.setAttribute("auth", id);
	
	
	String location = "/jspPro/days07/ex07.jsp";	// 메인페이지
	
	String referer = (String)session.getAttribute("referer");
	if( referer != null ){
		location = referer;
		session.removeAttribute("referer");
	}
	
	response.sendRedirect(location);
	
%>
