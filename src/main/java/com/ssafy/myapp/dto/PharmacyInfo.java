package com.ssafy.myapp.dto;

public class PharmacyInfo {
	private String name;
	private String phone;
	private String lat;
	private String lng;
	private String dong;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	@Override
	public String toString() {
		return "PharmacyInfo [name=" + name + ", phone=" + phone + ", lat=" + lat + ", lng=" + lng + ", dong=" + dong
				+ "]";
	}
}