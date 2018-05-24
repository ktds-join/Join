package com.join.landmark.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.join.landmark.vo.LandmarkVO;

public class LandmarkDaoImplForOracle extends SqlSessionDaoSupport implements LandmarkDao{

	@Override
	public List<LandmarkVO> selectAll() {
		return getSqlSession().selectList("LandmarkDao.selectAll");
	}

	@Override
	public List<LandmarkVO> selectFromCity(int tripCityId) {
		return getSqlSession().selectList("LandmarkDao.selectFromCity",tripCityId);
	}

	@Override
	public List<LandmarkVO> selectFromStyle(int tripStyleId) {
		return getSqlSession().selectList("LandmarkDao.selectFromStyle",tripStyleId);
	}

}
