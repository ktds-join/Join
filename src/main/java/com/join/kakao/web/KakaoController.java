package com.join.kakao.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class KakaoController {
	
	@RequestMapping(value="/oauth/kakao" , method=RequestMethod.GET) 
	public String viewKakaoLoginPage(HttpServletRequest request) {
		
		return "main/kakaotest";
	}
	
}
