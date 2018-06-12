package com.join.mate.dao;

import java.util.List;

import com.join.mate.vo.MateVO;

public interface MateDao {
	
	public List<MateVO> selectMateList();

	public int insertMate(MateVO mateVO);

	public MateVO selectCountMateList(int mateId);
	
	public int updateMatePoint(MateVO mateVO);

	public int selectCountMate(int mateHostId);

	public int selectCountMemerMate(int memberId);
<<<<<<< HEAD

=======
>>>>>>> 0a70c7ae3cc3a18ee2bf0c068c66842fa1057b8c
}
