package com.join.landmark.dao;

import java.util.List;

import com.join.landmark.vo.LandmarkVO;

public interface LandmarkDao {

	//전체 랜드마크 가져오기
	public List<LandmarkVO> selectAll();
	
	public List<LandmarkVO> selectFromCity(int tripCityId);
	public List<LandmarkVO> selectFromStyle(int tripStyleId);
	
}
