package com.join.matching.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MatchingController {
	
	@RequestMapping("/list")
	public String viewMypage() {
		return "matching/list";
	}

}
