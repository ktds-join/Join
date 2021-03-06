package com.join.member.service;

import java.sql.Date;

import com.join.member.vo.MemberVO;

public interface MemberService {
	
	public MemberVO readMember(MemberVO memberVO);
	
	public void keepLogin(int memberId, String sessionId, Date next);
	
	public MemberVO checkMemberWithSessionKey(String sessionId);
	
	public boolean createMember(MemberVO memberVO);

	
	public boolean readCountMemberEmail(String memberEmail);
	
	public boolean readCountMemberNickname(String memberNickname);
	
}
