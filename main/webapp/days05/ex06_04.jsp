<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 새로운 쿠키 생성 + setMaxAge[0] -->
<%
	// 삭제할 쿠키의 값들이 전부 들어가진다.
	String[] delCookieNames = request.getParameterValues("ckbCookie");
	for(int i = 0; i < delCookieNames.length; i++){
		String cookieName = delCookieNames[i];
		String cookieValue = "";
		Cookie c = new Cookie(cookieName, cookieValue);
		// 새로운 쿠키 하나 받아서 setMaxAge()를 0 으로 세팅해서 삭제
		c.setMaxAge(0);
		response.addCookie(c);
	}


%>
<script>
	alert("쿠키 삭제 완료!!");
	location.href = "jspPro/days05/ex06_03.jsp";
</script>