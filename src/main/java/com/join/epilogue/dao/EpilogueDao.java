package com.join.epilogue.dao;

import java.util.List;

import com.join.epilogue.vo.EpiloguePictureVO;
import com.join.epilogue.vo.EpilogueVO;

public interface EpilogueDao {
	
	public int insertEpilogue(EpilogueVO epilogueVO);
	
	public int insertEpiloguePictures(EpiloguePictureVO epiloguePictureVO);
	
	public int selectEpilogueId();
	
	public List<EpilogueVO> selectAllEpilogues();
	
}
