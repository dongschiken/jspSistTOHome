<%@ page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cookieName = request.getParameter("cookieName");
	String cookieValue = request.getParameter("cookieValue");

	// jsp 쿠키 생성 방법
	// ( 주의사항 ) 쿠키의 value가 한글인 경우 반드시 인코딩이 필요하다.
	// 거의 모든 경우 URLEcoder를 사용해서 UTF-8로 만들어 주기 
	Cookie cookie = new Cookie(cookieName, URLEncoder.encode(cookieValue, "UTF-8"));
	cookie.setMaxAge(-1); // 브라우저가 닫히면 자동으로 쿠키가 제거된다.
	//cookie.setDomain(localhost);
	//cookie.setPath(contextPath); /jspPro/days05
	response.addCookie(cookie);
	
	String location = "/jspPro/days05/ex06_03.jsp";
	response.sendRedirect(location);
%>