package com.ssafy.myapp.dto;

public class Hospital {

	String name;
	String address;
	String lat;
	String lng;
	String dong;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public Hospital(String name, String address, String lat, String lng, String dong) {
		this.name = name;
		this.address = address;
		this.lat = lat;
		this.lng = lng;
		this.dong = dong;
	}

	public Hospital() {
	}

	@Override
	public String toString() {
		return "Hospital [name=" + name + ", address=" + address + ", lat=" + lat + ", lng=" + lng + ", dong=" + dong
				+ "]";
	}

}
