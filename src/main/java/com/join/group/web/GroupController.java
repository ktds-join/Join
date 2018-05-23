package com.join.group.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GroupController {
	
	@RequestMapping("/list")
	public String viewMypage() {
		return "matching/list";
	}

}
