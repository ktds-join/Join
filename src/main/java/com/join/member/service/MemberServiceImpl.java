package com.join.member.service;

import com.join.member.dao.MemberDao;
import com.join.member.vo.MemberVO;

public class MemberServiceImpl implements MemberService {

	private MemberDao memberDao;
  
	@Override
	public MemberVO readMember(MemberVO memberVO) {
		return memberDao.selectMember(memberVO);
	}
	
	@Override
	public boolean readCountMemberEmail(String email) {
		return memberDao.selectCountMemberEmail(email) > 0;
	}
	
	@Override
	public boolean readCountMemberNickname(String nickname) {
		return memberDao.selectCountMemberNickname(nickname) > 0;
	}
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public boolean createMember(MemberVO memberVO) {
		return memberDao.insertMember(memberVO) > 0;
	}

	@Override
	public boolean removeMember(int userId) {
		return memberDao.deleteMember(userId) > 0;
	}

}
