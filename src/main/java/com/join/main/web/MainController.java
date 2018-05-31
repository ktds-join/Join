package com.join.main.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.join.main.service.MainService;
import com.join.member.constants.Member;

@Controller
public class MainController {

	private MainService mainService;
	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}
	
	@RequestMapping("/main")
	public String viewMain(HttpSession session) {
		return "main/main";
	}

	/*@RequestMapping("/main/checked/tripStyle")
	public String viewCheckedStyle(HttpSession session) {
		if ( session.getAttribute(Member.MEMBER) != null ) {
			return "redirect:/recommend";
		}
		return "redirect:/login";
	}
	*/
}
