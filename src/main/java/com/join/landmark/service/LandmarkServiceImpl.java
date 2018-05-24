package com.join.landmark.service;

import java.util.List;

import com.join.landmark.dao.LandmarkDao;
import com.join.landmark.vo.LandmarkVO;

public class LandmarkServiceImpl implements LandmarkService{
	private LandmarkDao landmarkDao;
	public void setLandmarkDao(LandmarkDao landmarkDao) {
		this.landmarkDao = landmarkDao;
	}
	
	@Override
	public List<LandmarkVO> getAll() {
		return landmarkDao.selectAll();
	}

	@Override
	public List<LandmarkVO> getCity(int tripCityId) {
		return landmarkDao.selectFromCity(tripCityId);
	}

	@Override
	public List<LandmarkVO> getStyle(int tripStyleId) {
		return landmarkDao.selectFromStyle(tripStyleId);
	}

}
