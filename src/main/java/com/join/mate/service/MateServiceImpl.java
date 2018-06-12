package com.join.mate.service;

import java.util.List;

import com.join.mate.dao.MateDao;
import com.join.mate.vo.MateVO;

public class MateServiceImpl implements MateService {
	
	private MateDao mateDao;
	
	public void setMateDao(MateDao mateDao) {
		this.mateDao = mateDao;
	}

	@Override
	public List<MateVO> getMateList() {
		return mateDao.selectMateList();
	}

	@Override
	public boolean createMate(MateVO mateVO) {
		return mateDao.insertMate(mateVO) > 0;
	}

	@Override
	public MateVO readMateById(int mateId) {
		return mateDao.selectCountMateList(mateId);
	}

	@Override
	public boolean updateMatePoint(MateVO mateVO) {
		return mateDao.updateMatePoint(mateVO) > 0;
	}
	
<<<<<<< HEAD
=======
	@Override
>>>>>>> 0a70c7ae3cc3a18ee2bf0c068c66842fa1057b8c
	public int readMateByMemberId(int mateHostId) {
		return mateDao.selectCountMate(mateHostId);
	}

	@Override
	public boolean readCountMemberMate(int memberId) {
		
		if(mateDao.selectCountMemerMate(memberId) == 0) {
			return true;
		}
		else {
			return false;
		}
	}

}
