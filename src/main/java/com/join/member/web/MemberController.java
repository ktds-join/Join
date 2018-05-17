package com.join.member.web;

import java.sql.Date;

import javax.servlet.http.Cookie;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
			return "redirect:/main1";
		}
		return "member/login";
	} 
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String doLoginAction(@ModelAttribute("loginForm") @Valid MemberVO memberVO, Errors errors, 
								HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		String returnURL = "";
		
		MemberVO loginMember =  memberService.readMember(memberVO);
		loginMember.setMaintainSession(memberVO.isMaintainSession());
			
		if ( loginMember != null ) {
			
			session.setAttribute(Member.MEMBER, loginMember);
			returnURL = "redirect:/main1";
			
			if ( loginMember.isMaintainSession() ) {
				
				Cookie cookie = new Cookie("loginCookie", session.getId());
				cookie.setPath("/");
				
				int timeAmount = 60*60*6;
				cookie.setMaxAge(timeAmount);
				
				response.addCookie(cookie);
				
				Date sessionLimit = new Date(
							System.currentTimeMillis() + (1000*timeAmount));
				memberService.keepLogin(memberVO.getMemberId(),
										session.getId(), sessionLimit);
			}
		}
		returnURL = "redirect:/main1";
		return returnURL;	
	}	
	
	@RequestMapping("/logout")
	public String doLogoutAction(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		MemberVO memberVO = (MemberVO) session.getAttribute(Member.MEMBER);
        
		if ( memberVO != null ) {
            session.removeAttribute(Member.MEMBER);
            session.invalidate();
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
            
            if ( loginCookie != null ){
                loginCookie.setPath("/");
                loginCookie.setMaxAge(0);
                response.addCookie(loginCookie);
                 
                Date date = new Date(System.currentTimeMillis());
                memberService.keepLogin(memberVO.getMemberId(), session.getId(), date);
            }
        }
        return "redirect:/main1";
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
	
	
	@RequestMapping(value="/tendency", method=RequestMethod.GET)
	public String viewTendency() {
		
		System.out.println("call tendency get");
//
//		if ( session.getAttribute(Member.MEMBER) != null ) {
//			return "redirect:/tendency";
//		}
		return "member/tendency";
	}
	

	// 세션 set해서 받아오,get해서 vo에 넣어주기
	@RequestMapping(value="/tendency", method=RequestMethod.POST)
	public String doTendency(MemberVO memberVO,
									 HttpSession session) {
		System.out.println("call tendency post");
		
		
		MemberVO member = (MemberVO) session.getAttribute(Member.MEMBER);
		
		memberVO.setMemberId(member.getMemberId());
	
		boolean isSuccess = memberService.createMember(memberVO);
		if(isSuccess) {
			return "redirect:/main1";
		}
		//memberService.
		
		System.out.println(memberVO.getMemberStyle1());
		System.out.println(memberVO.getMemberStyle2());
		System.out.println(memberVO.getMemberStyle3());
		System.out.println(memberVO.getMemberStyle4());
		System.out.println(memberVO.getMemberStyle5());
		
		
		// 매칭하는room으로 이동 test : login
		return "redirect:/main";
	}

	
//	@RequestMapping(value = "/regist", method = RequestMethod.POST)
//	public String doRegistAction(@ModelAttribute("registForm")
//								  @Valid MemberVO memberVO, Errors errors,
//								  HttpServletRequest request,
//								  Model model) {
//		if ( errors.hasErrors() ) {
//			return "member/regist";
//		}
//		
	
	
//	마이페이지

	@RequestMapping("/mypage")
	public String viewMypage(HttpSession session) {
		return "member/mypage";
	}
}
