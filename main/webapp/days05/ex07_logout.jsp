<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/inc/auth.jspf" %>
<%
	// 쿠키 삭제
	// 약속 : auth 쿠키이름 : 로그인ID 쿠키값으로 저장.
/* 	String cname = "auth";
	String logonID = null;
	
	Cookies cookies = new Cookies(request); */
	if( cookies.exists(cname)){
		logonID = cookies.getValue(cname);
		Cookie c =  Cookies.createCookie(cname, "", "/" , 0);
		response.addCookie(c);
		
	}
%>
<script>
	alert("<%= logonID %>님 로그아웃 하셨습니다.");
	location.href = "ex07_default.jsp";
</script>