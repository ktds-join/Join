package com.join.member.web;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.join.member.service.MemberService;
import com.join.member.vo.MemberVO;


@Controller
public class TendencyController {
	
	private MemberService memberService;
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping(value="/tendency", method=RequestMethod.GET)
	public String viewTendency() {
		return "/tendency";
	}
	
	@RequestMapping(value="/tendency", method=RequestMethod.POST)
	public String doTendency(@ModelAttribute("styleForm") @Valid MemberVO memberVO, HttpSession session) {
		 
		memberService.updateMemberStyle(memberVO);
		return "redirect:/matching";
	}
	
	
}
