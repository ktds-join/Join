package com.join.member.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String viewRegistPage() {
		return "member/regist";
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String doRegistAction(@ModelAttribute("registForm")
								 @Valid MemberVO memberVO, Errors errors) {
		
		if ( errors.hasErrors() ) {
			return "member/regist";
		}
		
		boolean isSuccess = memberService.createMember(memberVO);
		if ( isSuccess ) {
			return "redirect:/login";
		}
		
		return "member/regist";
	}
	
	@RequestMapping("/api/exists/memberEmail")
	@ResponseBody
	public Map<String, Boolean> apiIsExistsEmail(@RequestParam String memberEmail) {
		boolean isExists = memberService.readCountMemberEmail(memberEmail);
		
		Map<String, Boolean> response = new HashMap<String, Boolean>();
		response.put("response", isExists);
		
		return response;
	}
	
	@RequestMapping("/api/exists/memberNickname")
	@ResponseBody
	public Map<String, Boolean> apiIsExistsNickname(@RequestParam String memberNickname) {
		boolean isExists = memberService.readCountMemberNickname(memberNickname);
		
		Map<String, Boolean> response = new HashMap<String, Boolean>();
		response.put("response", isExists);
		
		return response;
	}
	
}
