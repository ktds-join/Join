package com.join.mate.dao;

import java.util.List;

import com.join.mate.vo.MateVO;

public interface MateDao {
	
	public List<MateVO> selectMateList();

	public int insertMate(MateVO mateVO);

	public MateVO selectCountMateList(int mateId);
<<<<<<< HEAD
	
	public int updateMatePoint(MateVO mateVO);
=======

	public int selectCountMate(int mateHostId);

	public int selectCountMemerMate(int memberId);
>>>>>>> 96e9c4d05387f8e82cabd573c7b4398c87452c4d
}
