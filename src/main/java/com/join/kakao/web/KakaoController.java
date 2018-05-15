package com.join.kakao.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class KakaoController {
	
	@RequestMapping(value="/oauth/kakao" , method=RequestMethod.GET) 
	public String viewKakaoLoginPage() {
		
		return "main/kakao";
	}
	
}
