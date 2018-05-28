package com.join.mate.service;

import java.util.List;

import com.join.mate.vo.MateVO;

public interface MateService {
	
	public List<MateVO> getMateList();
	
	public boolean createMate(MateVO mateVO);

}
