package com.join.member.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.join.member.vo.MemberVO;

public class MemberDaoImplForOracle extends SqlSessionDaoSupport implements MemberDao{
	
	@Override
	public MemberVO selectMember(MemberVO memberVO) {
		return getSqlSession().selectOne("MemberDao.selectMember", memberVO);
	}
	
	@Override
	public void keepLogin(int memberId, String sessionId, Date next) {
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("memberId", memberId);
		map.put("sessionId", sessionId);
		map.put("next", next);
		
		getSqlSession().update("MemberDao.maintainLogin",map);
	}
	
	@Override
	public MemberVO checkMemberWithSessionKey(String sessionId) {
		return getSqlSession().selectOne("MemberDao.checkMemberWithSessionKey",sessionId);
	}
	
	@Override
	public int insertMember(MemberVO memberVO) {
		return getSqlSession().insert("MemberDao.insertMember", memberVO);
	}

	@Override
	public int selectCountMemberEmail(String memberEmail) {
		return getSqlSession().selectOne("MemberDao.selectCountMemberEmail", memberEmail);
	}

	@Override
	public int selectCountMemberNickname(String memberNickname) {
		return getSqlSession().selectOne("MemberDao.selectCountMemberNickname", memberNickname);
	}
	
}
