package com.join.mate.service;

import java.util.List;

import com.join.mate.vo.MateVO;

public interface MateService {
	
	public List<MateVO> getMateList();
	
	public boolean createMate(MateVO mateVO);

	public MateVO readMateById(int mateId);
	
	public boolean updateMatePoint(MateVO mateVO);

}
