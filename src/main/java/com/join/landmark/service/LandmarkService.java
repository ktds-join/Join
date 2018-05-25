package com.join.landmark.service;

import java.util.List;

import com.join.landmark.vo.LandmarkVO;

public interface LandmarkService {

	public List<LandmarkVO> getAll();
	
	public List<LandmarkVO> getCity(int tripCityId);
	public List<LandmarkVO> getStyle(int tripStyleId);
	
}
