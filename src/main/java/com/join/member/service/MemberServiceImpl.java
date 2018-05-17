package com.join.member.service;

import java.sql.Date;

import com.join.member.dao.MemberDao;
import com.join.member.vo.MemberVO;
import com.join.util.SHA256Util;

public class MemberServiceImpl implements MemberService {

	private MemberDao memberDao;
  
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	@Override
	public MemberVO readMember(MemberVO memberVO) {
		
		// 1. MemberVO : memberEmail로 SALT 가져오기
		String salt = memberDao.selectSalt(memberVO.getMemberEmail());
		if ( salt == null ) {
			salt = "";
		}
		
		// 2. SALT로 암호화
		String password = memberVO.getMemberPassword();
		password = SHA256Util.getEncrypt(password, salt);
		memberVO.setMemberPassword(password);
		
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
		
		// SALT 생성
		String salt = SHA256Util.generateSalt();
		memberVO.setSalt(salt);
		String password = memberVO.getMemberPassword();
		
		// 비밀번호 암호화
		password = SHA256Util.getEncrypt(password, salt);
		memberVO.setMemberPassword(password);
		
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
