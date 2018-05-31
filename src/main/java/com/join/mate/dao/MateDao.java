package com.join.mate.dao;

import java.util.List;

import com.join.mate.vo.MateVO;

public interface MateDao {
	
	public List<MateVO> selectMateList();

	public int insertMate(MateVO mateVO);

	public MateVO selectCountMateList(int mateId);

	public int selectCountMate(int mateHostId);

	public int selectCountMemerMate(int memberId);
}
