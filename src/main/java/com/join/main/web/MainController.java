package com.join.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.join.main.service.MainService;
import com.join.main.vo.StyleVO;

@Controller
public class MainController {

	private MainService mainService;
	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}
	
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String viewMain() {

		return "main/main";
	}
	
	
	
	
	
}
