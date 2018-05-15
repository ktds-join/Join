package com.join.member.dao;

import com.join.member.vo.MemberVO;

public interface MemberDao {

	public MemberVO selectMember(MemberVO memberVO);
	
	public int selectCountMemberEmail(String email);
	
	public int selectCountMemberNickname(String nickname);
	
	public int insertMember(MemberVO memberVO);
	
	public int deleteMember(int userId);
	
}
