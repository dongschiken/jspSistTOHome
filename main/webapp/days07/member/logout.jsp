<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// 모든 세션 삭제
	session.invalidate();

	/* 한개의 세션을 삭제 */
	//session.removeAttribute(name);
	
	String location = "/jspPro/days07/ex07.jsp";
	response.sendRedirect(location);
	
%>