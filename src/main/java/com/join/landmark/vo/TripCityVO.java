package com.join.landmark.vo;

public class TripCityVO {

	private int tripCityId;
	private String tripCityTitle;

	//위도 경도는 지도 구현한 다음에
	private float tripCityLatitude;
	private float tripCityLongitude;
	
	public int getTripCityId() {
		return tripCityId;
	}
	public void setTripCityId(int tripCityId) {
		this.tripCityId = tripCityId;
	}
	public String getTripCityTitle() {
		return tripCityTitle;
	}
	public void setTripCityTitle(String tripCityTitle) {
		this.tripCityTitle = tripCityTitle;
	}
	public float getTripCityLatitude() {
		return tripCityLatitude;
	}
	public void setTripCityLatitude(float tripCityLatitude) {
		this.tripCityLatitude = tripCityLatitude;
	}
	public float getTripCityLongitude() {
		return tripCityLongitude;
	}
	public void setTripCityLongitude(float tripCityLongitude) {
		this.tripCityLongitude = tripCityLongitude;
	}
	
}
