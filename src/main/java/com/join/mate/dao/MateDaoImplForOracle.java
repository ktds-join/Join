package com.join.mate.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.join.mate.vo.MateVO;

public class MateDaoImplForOracle extends SqlSessionDaoSupport implements MateDao{

	@Override
	public List<MateVO> selectMateList() {
		return getSqlSession().selectList("mateDao.selectMateList");
	}

}
