package com.join.mate.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.join.mate.service.MateService;
import com.join.mate.vo.MateVO;
import com.join.member.constants.Member;
import com.join.member.vo.MemberVO;

@Controller
public class MateController {
	
	private MateService mateService;
	
	public void setMateService(MateService mateService) {
		this.mateService = mateService;
	}
	
	@RequestMapping("/mate/list")
	public ModelAndView viewMateListpage(HttpSession session) {
		

		MemberVO member = (MemberVO) session.getAttribute(Member.MEMBER);
		
		ModelAndView view = new ModelAndView();
		
		view.setViewName("mate/list");
		
		List<MateVO> totalList = mateService.getMateList();
		List<MateVO> mateList = new ArrayList<MateVO>();
		
		for ( MateVO mateVO : totalList ) {
			int checkedNumber = 0;
			if ( Math.abs( mateVO.getMateStyle1() - member.getMemberStyle1() ) <= 50 ) {
				checkedNumber++;
			}
			if ( Math.abs( mateVO.getMateStyle2() - member.getMemberStyle2() ) <= 50 ) {
				checkedNumber++;
			}
			if ( Math.abs( mateVO.getMateStyle3() - member.getMemberStyle3() ) <= 50 ) {
				checkedNumber++;
				if ( checkedNumber == 3 ) {
					mateList.add(mateVO);
				} else if ( Math.abs( mateVO.getMateStyle4() - member.getMemberStyle4() ) <= 50 ) {
					checkedNumber++;
					if ( checkedNumber == 3 ) {
						mateList.add(mateVO);
					} else if ( Math.abs( mateVO.getMateStyle5() - member.getMemberStyle5() ) <= 50 ) {
						checkedNumber++;
						if (checkedNumber == 3) {
							mateList.add(mateVO);
						}     
					}
				}
			}
		}
		
		view.addObject("mateList",mateList);
	/*
	 * matePoint
	 */
		return view;
	}
	
	@RequestMapping(value = "/mate/write", method = RequestMethod.GET)
	public ModelAndView viewWriteMatePage(HttpSession session) {
		
		ModelAndView view = new ModelAndView();
		view.setViewName("mate/write");
		
		MemberVO member = (MemberVO) session.getAttribute(Member.MEMBER);
		view.addObject("member", member);
		
		return view;
		
	}
	
	@RequestMapping(value = "/mate/write", method = RequestMethod.POST)
	public String makeWriteMatePage(MateVO mateVO) {
		
		int matePoint;
		
		boolean isSuccess = mateService.createMate(mateVO);
		
		System.out.println(mateVO.getMateStyle1());
			
		if( isSuccess ) {
			return "redirect:/mate/social";
		}
		return "redirect:/mate/write";
	}
	
	@RequestMapping("/mate/social")
	public String viewSocialPage() {
		return "mate/social";
	}
	
	

}
