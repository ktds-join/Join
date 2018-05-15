package com.join.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.join.main.service.MainService;

@Controller
public class MainController {

	private MainService mainService;
	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}
	
	@RequestMapping("/main")
	public String viewMain() {
		return "main/main";
	}
	@RequestMapping("/index")
	public String viewIndex() {
		return "main/index";
	}
	@RequestMapping("/yourStatus")
	public String viewStartPage() {
		return "main/startPage";
	}
}
