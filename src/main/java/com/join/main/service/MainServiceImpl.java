package com.join.main.service;

import com.join.main.dao.MainDAO;

public class MainServiceImpl implements MainService{

	private MainDAO mainDao;
	public void setMainDao(MainDAO mainDao) {
		this.mainDao = mainDao;
	}
}
