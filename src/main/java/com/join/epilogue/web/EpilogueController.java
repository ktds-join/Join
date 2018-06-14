package com.join.epilogue.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping("/epiList")
	public ModelAndView viewEpilogueListPage(HttpSession session) {
		
		ModelAndView view = new ModelAndView();
		
		if ( session.getAttribute(Member.MEMBER) == null ) {
			view.setViewName("redirect:/login");
			return view;
		}
		
		List<EpilogueVO> epilogueList = epilogueService.readAllEpilogues();
		view.addObject("epilogueList", epilogueList);
		view.setViewName("epilogue/epiList");
		
		return view;
	}
	
	@RequestMapping(value="/epiWrite", method=RequestMethod.GET)
	public String viewWritePage() {
		return "epilogue/epiWrite";
	}
	
	@RequestMapping(value="/epiWrite", method=RequestMethod.POST)
	public ModelAndView doWriteEpilogue(@ModelAttribute("epilogueForm") @Valid EpilogueVO epilogue,
					Errors errors, EpiloguePictureVO epiloguePictureVO, HttpSession session, HttpServletRequest request) {
		
		if ( session.getAttribute(Member.MEMBER) == null ) {
			return new ModelAndView("redirect:/login");
		}
		
		if( errors.hasErrors() ) {
			ModelAndView view = new ModelAndView();
			view.setViewName("epilogue/epiWrite");
			view.addObject("epilogue", epilogue);
			return view;
		}
		
		boolean isSuccess = epilogueService.createEpilogue(epilogue);
		//boolean isEpiloguePicture = epilogueService.createEpiloguePictures(epiloguePictureVO);
		
		if ( isSuccess ) {
			return new ModelAndView("redirect:/epiList");
		}
		
		return new ModelAndView("redirect:/epiWrite");
	}
	
	@RequestMapping("/epiDetail/{epilogueId}")
	public ModelAndView viewEpilogueDetailPage(@PathVariable int epilogueId) {
		
		EpilogueVO epilogue = epilogueService.readEpilogue(epilogueId);
	
		ModelAndView view = new ModelAndView();
		view.setViewName("epilogue/epiDetail");
		view.addObject("epilogue", epilogue);
		
		return view;
	}
}
