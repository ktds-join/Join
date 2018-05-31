package com.join.mate.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.join.mate.service.MateService;
import com.join.mate.vo.MateVO;
import com.join.member.constants.Member;
import com.join.member.service.MemberService;
import com.join.member.vo.MemberVO;

@Controller
public class MateController {
	
	private MateService mateService;
	private MemberService memberService;
	
	public void setMateService(MateService mateService) {
		this.mateService = mateService;
	}
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
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
	public String makeWriteMatePage(MateVO mateVO, HttpSession session, MemberVO memberVO) {
		
<<<<<<< HEAD
		int matePoint;
		
		boolean isSuccess = mateService.createMate(mateVO);
		
		System.out.println(mateVO.getMateStyle1());
			
=======
		//현재 만든 사람의 정보를 불러온다.
		memberVO = (MemberVO) session.getAttribute(Member.MEMBER);			
		//불러진 정보중 아이디를 넣는다.
		mateVO.setMateHostId(memberVO.getMemberId());
		//DB에 hostId를 포함한 모든 정보를 넣는다.
		boolean isSuccess = mateService.createMate(mateVO);
		
		int mateId = mateVO.getMateId();
		

		//혹시모를 쿼리에 대한 IF문 유지
>>>>>>> 82367749dde5d9d8316fea64c3586bb2665e9f09
		if( isSuccess ) {
			return "redirect:/mate/social/" + mateId ;
		}
		return "redirect:/mate/write";
	}
	
//	@RequestMapping("/mate/social")
//	public String goSocialPage(MateVO mateVO, MemberVO memberVO, HttpSession session) {
//		
//		memberVO = (MemberVO) session.getAttribute( Member.MEMBER );
//		
//		mateVO.setMateHostId( memberVO.getMemberId() );
//		int mateId = mateVO.getMateId();
//		
//		return "redirect:/mate/social" + mateId;
//	}
	
	@RequestMapping("/mate/social/{mateId}")
	public ModelAndView viewSocialPage( @PathVariable int mateId, MateVO mateVO, HttpSession session, MemberVO memberVO ) {
		System.out.println("/mate/social/{mateId} 진입 완료");
		ModelAndView view = new ModelAndView();
		view.setViewName("mate/social");
		System.out.println("setViewName 완료");
		
		mateVO = mateService.readMateById(mateId);
		view.addObject("social", mateVO);
		System.out.println("readMateById 완료");
		
		memberVO = (MemberVO) session.getAttribute(Member.MEMBER);
		
		System.out.println(mateVO);
		System.out.println("메이트 아이디 : " + mateVO.getMateId());
		System.out.println("호스트 아이디 : " + mateVO.getMateHostId());
		System.out.println("멤버 아이디 : " + memberVO.getMemberId());
		
		// 현재 접속한 사람이 방장인지 아닌지 판단하는 쿼리문 작성 필요.
		if( mateVO.getMateHostId() == memberVO.getMemberId()) {
			
			session.setAttribute("status", "host");
			return view;
			
		}
		else {
			
			session.setAttribute("status", "guest");
			return view;
			
		}
		
	}
	
	
	

}
