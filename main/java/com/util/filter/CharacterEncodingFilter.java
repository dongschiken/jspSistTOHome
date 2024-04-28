package com.util.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter {

	
	
	
	@Override
	public void destroy() {
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.encoding = filterConfig.getInitParameter("encoding");
	}
	
	private String encoding = "UTF-8";
	
	// 필터링 할 코드들
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println(">> CharacterEncodingFilter.doFilter() 메서드 호출~~");
		request.setCharacterEncoding(this.encoding);
		
		// 다음 필터로 보낸다.
		chain.doFilter(request, response);
		
		
	}
	
}
