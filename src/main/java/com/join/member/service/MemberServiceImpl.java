package com.join.member.service;

import java.sql.Date;

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
	public void keepLogin(int memberId, String sessionId, Date next) {
		memberDao.keepLogin(memberId, sessionId, next);
	}
	
	@Override
	public MemberVO checkMemberWithSessionKey(String sessionId) {
		return memberDao.checkMemberWithSessionKey(sessionId);
	}

	@Override
	public boolean createMember(MemberVO memberVO) {
		return memberDao.insertMember(memberVO) > 0;
	}

	@Override
	public boolean readCountMemberEmail(String memberEmail) {
		return memberDao.selectCountMemberEmail(memberEmail) > 0;
	}

	@Override
	public boolean readCountMemberNickname(String memberNickname) {
		return memberDao.selectCountMemberNickname(memberNickname) > 0;
	}

}
