package com.join.member.web;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.join.member.constants.Member;
import com.join.member.service.MemberService;
import com.join.member.vo.MemberVO;
import com.join.util.DownloadUtil;

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
				
		MemberVO loginMember =  memberService.readMember(memberVO);
			
		if ( loginMember != null ) {
			
			loginMember.setMaintainSession(memberVO.isMaintainSession());
			session.setAttribute(Member.MEMBER, loginMember);
			
			if ( loginMember.isMaintainSession() ) {
				
				Cookie cookie = new Cookie(Member.COOKIE, session.getId());
				cookie.setPath("/");
				
				int timeAmount = 60*60*6;
				cookie.setMaxAge(timeAmount);
				
				response.addCookie(cookie);
				
				Date sessionLimit = new Date(
							System.currentTimeMillis() + (1000*timeAmount));
				memberService.keepLogin(memberVO.getMemberId(),
										session.getId(), sessionLimit);
			}
			
			return "redirect:/main";
		}
		
		return "member/login";	
	}	
	
	@RequestMapping("/logout")
	public String doLogoutAction(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		MemberVO memberVO = (MemberVO) session.getAttribute(Member.MEMBER);
        
		if ( memberVO != null ) {
            session.removeAttribute(Member.MEMBER);
            session.invalidate();
            Cookie loginCookie = WebUtils.getCookie(request, Member.COOKIE);
            System.out.println(loginCookie);
            
            if ( loginCookie != null ){
            	System.out.println("loginCookie is not null");
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
		
		memberVO.save();
		
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
	
	@RequestMapping("/profile/{memberId}")
	public void viewProfileAction(@PathVariable int memberId,
								   HttpServletRequest request,
								   HttpServletResponse response) {
		MemberVO loginMember = memberService.readMemberById(memberId);
		String memberProfileName = loginMember.getMemberProfileName();
		DownloadUtil downloadUtil = new DownloadUtil("D:/uploadProfiles/" + memberProfileName);
		
		try {
			downloadUtil.download(request, response, memberProfileName);
		} catch (UnsupportedEncodingException uee) {
			throw new RuntimeException(uee.getMessage(), uee);
		}
	}
	
	@RequestMapping(value="/tendency", method=RequestMethod.GET)
	public String viewTendency() {
		
		return "member/tendency";
	}
	
	@RequestMapping(value="/tendency", method=RequestMethod.POST)
	public String doTendency(MemberVO memberVO, HttpSession session) {
		
		MemberVO member = (MemberVO) session.getAttribute(Member.MEMBER);
		memberVO.setMemberId(member.getMemberId());
	
		memberService.updateMemberStyle(memberVO);
		
		session.setAttribute(Member.MEMBER, memberVO);
		
		return "redirect:/list";
		
	}
	
	// 마이페이지
	@RequestMapping("/myPage")
	public String viewMypage(HttpSession session) {
		return "member/myPage";
	}

}
