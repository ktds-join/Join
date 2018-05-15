package com.join.member.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping("/api/exists/email")
	@ResponseBody
	public Map<String, Boolean> apiIsExistsEmail(@RequestParam String email){
		
		boolean isExists = memberService.readCountMemberEmail(email);
		
		Map<String, Boolean> response = new HashMap<String, Boolean>();
		response.put("response", isExists);
		return response;
		
	}
	
	@RequestMapping("/api/exists/nickname")
	@ResponseBody
	public Map<String, Boolean> apiIsExistsNickname(@RequestParam String nickname){
		
		boolean isExists = memberService.readCountMemberNickname(nickname);
		
		Map<String, Boolean> response = new HashMap<String, Boolean>();
		response.put("response", isExists);
		return response;
		
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
	
//	@RequestMapping("/logout")
//	public String doLogoutAction(HttpSession session) {
//		session.invalidate();
//		return "redirect:/main";
//	}
//	
//	@RequestMapping(value= "/regist", method = RequestMethod.GET)
//	public String viewRegistPage() {
//		return "member/regist";
//	}
//	
//	@RequestMapping(value = "/regist", method = RequestMethod.POST)
//	public ModelAndView doRegistAction(@ModelAttribute("registForm") @Valid MemberVO memberVO) {
//		
//		if ( memberService.createMember(memberVO) ) {
//			return new ModelAndView("redirect:/login");
//		}
//		return new ModelAndView("redirect:/regist");
//	}
//	
//	@RequestMapping("/member/delete/{userId}")
//	public String doDeleteAction(HttpSession session, @PathVariable int userId) {
//
//		if ( memberService.removeMember(userId) ) {
//			session.invalidate();
//		}
//		return "member/delete";	
//		
//	}
//	
//	@RequestMapping("/upload/image")
//	public void download(@PathVariable int userId, HttpServletRequest request, HttpServletResponse response) {
//		MemberVO member = memberService.(userId);
//		String filename = member.getDisplayFilename();
//		DownloadUtil download = new DownloadUtil("D:\\uploadFiles/" + filename);
//		try {
//			download.download(request, response, filename);
//		} catch (UnsupportedEncodingException e) {
//			throw new RuntimeException(e.getMessage(), e);
//		}
//
//	}
		
	

}
