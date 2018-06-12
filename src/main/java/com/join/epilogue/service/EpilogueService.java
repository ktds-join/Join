package com.join.epilogue.service;

import com.join.epilogue.vo.EpiloguePictureVO;
import com.join.epilogue.vo.EpilogueVO;

public interface EpilogueService {
	
	public boolean createEpilogue(EpilogueVO epilogueVO);
	
	public boolean createEpiloguePictures(EpiloguePictureVO epiloguePictureVO);
	
	public int selectEpilogueId();
}
