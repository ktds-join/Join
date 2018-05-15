package com.join.member.service;

import com.join.member.dao.MemberDao;
import com.join.member.vo.MemberVO;

public class MemberServiceImpl implements MemberService {

	private MemberDao memberDao;
  
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	@Override
	public MemberVO readMember(MemberVO memberVO) {
		return memberDao.selectMember(memberVO);
	}

	@Override
	public boolean createMember(MemberVO memberVO) {
		return memberDao.insertMember(memberVO) > 0;
	}

}
