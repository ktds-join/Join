package com.join.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.join.main.vo.StyleVO;


@Controller
public class TendencyController {
	
	

	@RequestMapping(value="/tendency", method=RequestMethod.GET)
	public String viewTendency() {
		System.out.println("call main get");
		return "/tendency";
	}
	
	
	@RequestMapping(value="/tendency", method=RequestMethod.POST)
	public ModelAndView doTendency(StyleVO style) {
		System.out.println("call main post");
		
		System.out.println(style.getStyle1());
		System.out.println(style.getStyle2());
		System.out.println(style.getStyle3());
		System.out.println(style.getStyle4());
		System.out.println(style.getStyle5());
		
		return new ModelAndView("redirect:/matching");
	}
	
	
}
