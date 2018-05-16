package com.join.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.join.member.constants.Member;

public class SessionInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller)
			throws Exception {

		String contextPath = request.getContextPath();
		
		if ( request.getSession().getAttribute(Member.MEMBER) == null ) {
			response.sendRedirect(contextPath + "/login");
			return false;
		}
		return true;
	}

}
