package com.join.epilogue.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.join.epilogue.service.EpilogueService;
import com.join.epilogue.vo.EpiloguePictureVO;
import com.join.epilogue.vo.EpilogueVO;
import com.join.member.constants.Member;

@Controller
public class EpilogueController {
	
	private EpilogueService epilogueService;
	
	
	public void setEpilogueService(EpilogueService epilogueService) {
		this.epilogueService = epilogueService;
	}
	
	@RequestMapping("/epi")
	public String viewEpilogueListPage() {
		return "epilogue/epiList";
	}
	
	@RequestMapping(value="/epiWrite", method=RequestMethod.GET)
	public String viewWritePage() {
		return "epilogue/epiWrite";
	}
	
	@RequestMapping(value="/epiWrite", method=RequestMethod.POST)
	public ModelAndView doWriteEpilogue(@ModelAttribute("epilogueForm") @Valid EpilogueVO epilogue,
					Errors errors, EpiloguePictureVO epiloguePictureVO, HttpSession session, HttpServletRequest request) {
		System.out.println(epilogue.getEpiloguePictureVO().getEpiFile()+ "");
		
		if( session.getAttribute(Member.MEMBER) == null) {
			return new ModelAndView("redirect:/login");
		}
		
		if(errors.hasErrors()) {
			ModelAndView view = new ModelAndView();
			view.setViewName("epilogue/epiWrite");
			view.addObject("epilogue", epilogue);
			return view;
		}
		
		float grade = epilogue.getEpilogueGrade();
		epilogue.setEpilogueGrade(grade);
		
		// vo 저장
		epilogue.setEpilogueId(epilogue.getEpilogueId());
		epiloguePictureVO.setEpilogueId(epiloguePictureVO.getEpilogueId());
		
		boolean isEpilogue = epilogueService.createEpilogue(epilogue);
		boolean isEpiloguePicture = epilogueService.createEpiloguePictures(epiloguePictureVO);
		
		if (isEpilogue && isEpiloguePicture) {
			return new ModelAndView("redirect:/epi");
		}
		
		
		return new ModelAndView("redirect:/epiWrite");
	}
}
