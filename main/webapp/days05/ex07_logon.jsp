<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// 쿠키가 없어지는 조건은 떠있는 브라우저가 전부 닫혀야한다.
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	String location = "ex07_default.jsp";
	
	
	if( id.equals("admin") && password.equals("1234") ){
		// 관리자 로그인 성공
		// auth 쿠키 생성
		Cookie c =  Cookies.createCookie("auth", id , "/" , -1);
		response.addCookie(c);
	}else if(id.equals("hong") && password.equals("1234")){
		// 일반회원 로그인 성공
		Cookie c =  Cookies.createCookie("auth", id , "/" , -1);
		response.addCookie(c);
	}else if(id.equals("park") && password.equals("1234")) {
		// 일반회원 로그인 성공
		Cookie c =  Cookies.createCookie("auth", id , "/" , -1);
		response.addCookie(c);
	}else{
		// 로그인 실패
		location += "?logon=fail";
	}
	response.sendRedirect(location);
%>