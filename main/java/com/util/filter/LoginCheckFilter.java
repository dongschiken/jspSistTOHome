package com.util.filter;

import java.io.IOException;
import java.net.http.HttpRequest;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginCheckFilter implements Filter {


    public LoginCheckFilter() {
        // TODO Auto-generated constructor stub
    }

	public void destroy() {
		// TODO Auto-generated method stub
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("> LoginCheckFilter.doFilter 호출");
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		String auth = null; // 인증 ID
		boolean isAuth = false;
		
//		req.getSession(); == req.getSession(true);
		HttpSession session = req.getSession(isAuth);
		
		if( session != null && (auth = (String)session.getAttribute("auth")) != null  ) {
			isAuth = true; // 인증 O
		}
		
		if( isAuth ) {
			// admin/*  auth="admin"
			// admin/*  hongx ex07.jsp?fds
			
		}else {
			
			
		}
		
		// 만약 회원 관리를 하려면 auth가 admin인지 아닌지에 따라서 권한을 부여
		if( isAuth ) { // 인증 받음
			// if admin 폴더안의 요청 auth="admin"
			chain.doFilter(req, res);
		}else { // 인증 X
			String referer = req.getRequestURI();
			session.setAttribute("referer", referer);
			String location = "/jspPro/days07/member/logon.jsp";
			res.sendRedirect(location);
		}
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
