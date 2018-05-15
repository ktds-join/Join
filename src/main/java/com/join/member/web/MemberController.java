package com.join.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.join.member.constants.Member;
import com.join.member.service.MemberService;
import com.join.member.vo.MemberVO;

@Controller
public class MemberController {

	private MemberService memberService;

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String viewLoginPage(HttpSession session) {
		
		if ( session.getAttribute(Member.MEMBER) != null ) {
			return "redirect:/main";
		}
		return "member/login";
	} 
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String doLoginAction(@ModelAttribute("loginForm")@Valid MemberVO memberVO, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		MemberVO loginMember =  memberService.readMember(memberVO);
			
		if( loginMember != null ) {
			
			session.setAttribute(Member.MEMBER, loginMember);
			return "redirect:/main";
		}
		return "redirect:/login";	
	}	
	
	@RequestMapping("/logout")
	public String doLogoutAction(HttpSession session) {
		
		session.invalidate();
		return "redirect:/main";
	}
	
}
