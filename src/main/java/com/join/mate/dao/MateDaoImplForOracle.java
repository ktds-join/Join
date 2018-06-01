package com.join.mate.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.join.mate.vo.MateVO;

public class MateDaoImplForOracle extends SqlSessionDaoSupport implements MateDao{

	@Override
	public List<MateVO> selectMateList() {
		return getSqlSession().selectList("MateDao.selectMateList");
	}

	@Override
	public int insertMate(MateVO mateVO) {
		return getSqlSession().insert("MateDao.insertMate", mateVO);
	}

	@Override
	public MateVO selectCountMateList(int mateId) {
		return getSqlSession().selectOne("MateDao.selectCountMateList", mateId);
	}

	@Override
	public int updateMatePoint(MateVO mateVO) {
		return getSqlSession().update("MateDao.updateMatePoint", mateVO);
	}

}
