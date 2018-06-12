package com.join.epilogue.vo;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class EpiloguePictureVO {
	
	private int epiloguePictureId;
	private String epiloguePictureName;
	private int epilogueId;
	
//	private EpilogueVO epilogueVO;
	
	private MultipartFile epiFile;
	
	public int getEpiloguePictureId() {
		return epiloguePictureId;
	}
	
	public void setEpiloguePictureId(int epiloguePictureId) {
		this.epiloguePictureId = epiloguePictureId;
	}
	
	public String getEpiloguePictureName() {
		return epiloguePictureName;
	}
	
	public void setEpiloguePictureName(String epiloguePictureName) {
		this.epiloguePictureName = epiloguePictureName;
	}
	
	public int getEpilogueId() {
		return epilogueId;
	}
	
	public void setEpilogueId(int epilogueId) {
		this.epilogueId = epilogueId;
	}

/*	public EpilogueVO getEpilogueVO() {
		return epilogueVO;
	}

	public void setEpilogueVO(EpilogueVO epilogueVO) {
		this.epilogueVO = epilogueVO;
	}*/

	public MultipartFile getEpiFile() {
		return epiFile;
	}

	public void setEpiFile(MultipartFile epiFile) {
		this.epiFile = epiFile;
	}

	
	public String save() {

		if (epiFile != null && !epiFile.isEmpty()) {
			// file이 전송되고 그 파일이 비어있지 않다면
			epiloguePictureName = epiFile.getOriginalFilename();
			File newFile = new File("d:/uploadEpilogueFiles/" + epiFile.getOriginalFilename()); // upload하면 이 위치에 file을 써라
			try {
				epiFile.transferTo(newFile);
				return newFile.getAbsolutePath(); // 전송시킨 파일의 절대경로를 반환
			} catch (IllegalStateException e) {
				throw new RuntimeException(e.getMessage(), e);
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
		}
		return null;
	}
	
}
