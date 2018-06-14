package com.join.epilogue.vo;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

import com.join.mate.vo.MateVO;

public class EpilogueVO {
	
	private int epilogueId;
	@NotEmpty(message = "제목 입력은 필수입니다!")
	private String epilogueTitle;
	private String epilogueBody;
	private float epilogueGrade;
	private String epilogueWriteDate;
	
	private MateVO mateVO;
	private EpiloguePictureVO epiloguePictureVO;
	
	private MultipartFile test;
	
	
	public MultipartFile getTest() {
		return test;
	}

	public void setTest(MultipartFile test) {
		this.test = test;
	}

	private int mateId;

	
	public int getEpilogueId() {
		return epilogueId;
	}

	public void setEpilogueId(int epilogueId) {
		this.epilogueId = epilogueId;
	}

	public String getEpilogueTitle() {
		return epilogueTitle;
	}

	public void setEpilogueTitle(String epilogueTitle) {
		this.epilogueTitle = epilogueTitle;
	}

	public String getEpilogueBody() {
		return epilogueBody;
	}

	public void setEpilogueBody(String epilogueBody) {
		this.epilogueBody = epilogueBody;
	}

	public float getEpilogueGrade() {
		return epilogueGrade;
	}

	public void setEpilogueGrade(float epilogueGrade) {
		this.epilogueGrade = epilogueGrade;
	}

	public String getEpilogueWriteDate() {
		return epilogueWriteDate;
	}

	public void setEpilogueWriteDate(String epilogueWriteDate) {
		this.epilogueWriteDate = epilogueWriteDate;
	}

	public MateVO getMateVO() {
		return mateVO;
	}

	public void setMateVO(MateVO mateVO) {
		this.mateVO = mateVO;
	}
	
	public EpiloguePictureVO getEpiloguePictureVO() {
		return epiloguePictureVO;
	}

	public void setEpiloguePictureVO(EpiloguePictureVO epiloguePictureVO) {
		this.epiloguePictureVO = epiloguePictureVO;
	}

	public int getMateId() {
		return mateId;
	}

	public void setMateId(int mateId) {
		this.mateId = mateId;
	}
	
}
