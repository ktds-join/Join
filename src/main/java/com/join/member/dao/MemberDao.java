package com.join.member.dao;

import com.join.member.vo.MemberVO;

public interface MemberDao {

	public MemberVO selectMember(MemberVO memberVO);
	
	public int insertMember(MemberVO memberVO);
	
	public int selectCountMemberEmail(String memberEmail);
	
	public int selectCountMemberNickname(String memberNickname);
	
}
