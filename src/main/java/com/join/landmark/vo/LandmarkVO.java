package com.join.landmark.vo;

public class LandmarkVO {

	private int landmarkId;
	private String landmarkTitle;
	private String landmarkBody;
	private String landmarkImageName;
	private String landmarkAddress;
	
	private int tripCityId;
	private int tripStyleId;
	
	private TripCityVO tripCityVO;
	private TripStyleVO tripStyleVO;
	
	public int getLandmarkId() {
		return landmarkId;
	}
	public void setLandmarkId(int landmarkId) {
		this.landmarkId = landmarkId;
	}
	public String getLandmarkTitle() {
		return landmarkTitle;
	}
	public void setLandmarkTitle(String landmarkTitle) {
		this.landmarkTitle = landmarkTitle;
	}
	public String getLandmarkBody() {
		return landmarkBody;
	}
	public void setLandmarkBody(String landmarkBody) {
		this.landmarkBody = landmarkBody;
	}
	public String getLandmarkImageName() {
		return landmarkImageName;
	}
	public void setLandmarkImageName(String landmarkImageName) {
		this.landmarkImageName = landmarkImageName;
	}
	public String getLandmarkAddress() {
		return landmarkAddress;
	}
	public void setLandmarkAddress(String landmarkAddress) {
		this.landmarkAddress = landmarkAddress;
	}
	public int getTripCityId() {
		return tripCityId;
	}
	public void setTripCityId(int tripCityId) {
		this.tripCityId = tripCityId;
	}
	public int getTripStyleId() {
		return tripStyleId;
	}
	public void setTripStyleId(int tripStyleId) {
		this.tripStyleId = tripStyleId;
	}
	public TripCityVO getTripCityVO() {
		return tripCityVO;
	}
	public void setTripCityVO(TripCityVO tripCityVO) {
		this.tripCityVO = tripCityVO;
	}
	public TripStyleVO getTripStyleVO() {
		return tripStyleVO;
	}
	public void setTripStyleVO(TripStyleVO tripStyleVO) {
		this.tripStyleVO = tripStyleVO;
	}

}
