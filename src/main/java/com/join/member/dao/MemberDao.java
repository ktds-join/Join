package com.join.member.dao;

import java.sql.Date;

import com.join.member.vo.MemberVO;

public interface MemberDao {

	public MemberVO selectMember(MemberVO memberVO);
	
	public MemberVO selectMemberById(int memberId);
	
	public void keepLogin(int memberId, String sessionId, Date next);
	
	public MemberVO checkMemberWithSessionKey(String sessionId);
	
	public int insertMember(MemberVO memberVO);
	
	public int selectCountMemberEmail(String memberEmail);
	
	public int selectCountMemberNickname(String memberNickname);
	
	public String selectSalt(String memberEmail);
	
	public int updateMemberStyle(MemberVO memberVO);
	
	public int updateMember(MemberVO memberVO);

}
