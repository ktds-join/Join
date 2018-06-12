package com.join.mate.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		int mateHostId = 0;
		int mateId = 0;
		//현재 만든 사람의 정보를 불러온다.
		memberVO = (MemberVO) session.getAttribute(Member.MEMBER);			
		//불러진 정보중 아이디를 넣는다.
		mateVO.setMateHostId(memberVO.getMemberId());
		//DB에 hostId를 포함한 모든 정보를 넣는다.
		boolean isSuccess = mateService.createMate(mateVO);

		int matePoint = 0;
		float gap = Math.abs( mateVO.getMateStyle1() - memberVO.getMemberStyle1() );
		
		if ( gap == 0 ) {
			matePoint += 60;
		} else if ( gap <= 50 ) {
			matePoint += 55;
		} else if ( gap <= 100 ) {
			matePoint += 50;
		} else if ( gap <= 150 ) {
			matePoint += 45;
		} else if ( gap <= 200 ) {
			matePoint += 40;
		}
		
		gap = Math.abs( mateVO.getMateStyle2() - memberVO.getMemberStyle2() );
		
		if ( gap == 0 ) {
			matePoint += 50;
		} else if ( gap <= 50 ) {
			matePoint += 45;
		} else if ( gap <= 100 ) {
			matePoint += 40;
		} else if ( gap <= 150 ) {
			matePoint += 35;
		} else if ( gap <= 200 ) {
			matePoint += 30;
		}
		
		gap = Math.abs( mateVO.getMateStyle3() - memberVO.getMemberStyle3() );
		
		if ( gap == 0 ) {
			matePoint += 40;
		} else if ( gap <= 50 ) {
			matePoint += 35;
		} else if ( gap <= 100 ) {
			matePoint += 30;
		} else if ( gap <= 150 ) {
			matePoint += 25;
		} else if ( gap <= 200 ) {
			matePoint += 20;
		}
		
		gap = Math.abs( mateVO.getMateStyle4() - memberVO.getMemberStyle4() );
		
		if ( gap == 0 ) {
			matePoint += 30;
		} else if ( gap <= 50 ) {
			matePoint += 25;
		} else if ( gap <= 100 ) {
			matePoint += 20;
		} else if ( gap <= 150 ) {
			matePoint += 15;
		} else if ( gap <= 200 ) {
			matePoint += 10;
		}
		
		gap = Math.abs( mateVO.getMateStyle5() - memberVO.getMemberStyle5() );
		
		if ( gap == 0 ) {
			matePoint += 20;
		} else if ( gap <= 50 ) {
			matePoint += 15;
		} else if ( gap <= 100 ) {
			matePoint += 10;
		} else if ( gap <= 150 ) {
			matePoint += 5;
		} else if ( gap <= 200 ) {
			matePoint += 0;
		}
		mateHostId = memberVO.getMemberId();
		
		mateId = mateService.readMateByMemberId(mateHostId);
		
		System.out.println(mateId);
		
		if( isSuccess ) {
				mateService.updateMatePoint(mateVO);
				return "redirect:/mate/social/" + mateVO.getMateId();
		}
		return "redirect:/mate/write";
	}
	
	@RequestMapping("/api/exists/mate")
	@ResponseBody
	public Map<String, Boolean> apiIsExistsMate(HttpSession session) {
		
		MemberVO memberVO = (MemberVO) session.getAttribute(Member.MEMBER);
		int memberId = memberVO.getMemberId();
		
		boolean isCount = mateService.readCountMemberMate(memberId);
		
		Map<String, Boolean> response = new HashMap<String, Boolean>();
		response.put("response", isCount);
		
		return response;
	}
	
	@RequestMapping("/mate/social/{mateId}")
	public ModelAndView viewSocialPage( @PathVariable int mateId, MateVO mateVO, HttpSession session, MemberVO memberVO ) {

		ModelAndView view = new ModelAndView();
		view.setViewName("mate/social");
		
		mateVO = mateService.readMateById(mateId);
		view.addObject("social", mateVO);
		
		memberVO = (MemberVO) session.getAttribute(Member.MEMBER);
		
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
