package com.join.interceptors;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.join.member.constants.Member;
import com.join.member.service.MemberService;
import com.join.member.vo.MemberVO;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

	MemberService memberService;
     
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller)
            throws Exception {
         
    	HttpSession session = request.getSession();
        Object obj = session.getAttribute(Member.MEMBER);
        
        if ( obj == null ) {
        	
        	Cookie loginCookie = WebUtils.getCookie(request, Member.COOKIE);
        	
        	if ( loginCookie != null ) {
        		String sessionId = loginCookie.getValue();
        		MemberVO memberVO = memberService.checkMemberWithSessionKey(sessionId);
                 
		        if ( memberVO != null ) { 
		        	session.setAttribute(Member.MEMBER, memberVO);
		            return true;
		        }
		    }
             
		    response.sendRedirect("/login");
		    return false; 
		}
        return true;
    }
}
	
