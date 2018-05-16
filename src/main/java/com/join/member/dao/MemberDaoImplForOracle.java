package com.join.member.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.join.member.vo.MemberVO;

public class MemberDaoImplForOracle extends SqlSessionDaoSupport implements MemberDao{
	
	@Override
	public MemberVO selectMember(MemberVO memberVO) {
		return getSqlSession().selectOne("MemberDao.selectMember", memberVO);
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
