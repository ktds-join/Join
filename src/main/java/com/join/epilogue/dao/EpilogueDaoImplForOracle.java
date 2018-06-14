package com.join.epilogue.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.join.epilogue.vo.EpiloguePictureVO;
import com.join.epilogue.vo.EpilogueVO;

public class EpilogueDaoImplForOracle extends SqlSessionDaoSupport implements EpilogueDao {

	@Override
	public int insertEpilogue(EpilogueVO epilogueVO) {
		return getSqlSession().insert("EpilogueDao.insertEpilogue", epilogueVO);
	}

	@Override
	public int insertEpiloguePictures(EpiloguePictureVO epiloguePictureVO) {
		return getSqlSession().insert("EpilogueDao.insertEpiloguePictures", epiloguePictureVO);
	}

	@Override
	public int selectEpilogueId() {
		return getSqlSession().selectOne("EpilogueDao.selectEpilogueId");
	}

	@Override
	public List<EpilogueVO> selectAllEpilogues() {
		return getSqlSession().selectList("EpilogueDao.selectAllEpilogues");
	}

	@Override
	public EpilogueVO selectEpilogue(int epilogueId) {
		return getSqlSession().selectOne("EpilogueDao.selectEpilogue", epilogueId);
	}

}
