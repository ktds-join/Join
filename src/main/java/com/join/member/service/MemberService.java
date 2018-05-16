package com.join.member.service;

import com.join.member.vo.MemberVO;

public interface MemberService {
	
	public MemberVO readMember(MemberVO memberVO);
	
	public boolean createMember(MemberVO memberVO);
	
	public boolean readCountMemberEmail(String memberEmail);
	
	public boolean readCountMemberNickname(String memberNickname);
	
}
