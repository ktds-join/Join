package com.join.member.service;

import com.join.member.vo.MemberVO;

public interface MemberService {
	
	public MemberVO readMember(MemberVO memberVO);
	
	public boolean readCountMemberEmail(String email);
	
	public boolean readCountMemberNickname(String nickname);
	
	public boolean createMember(MemberVO memberVO);
	
	public boolean removeMember(int userId);
	
}
