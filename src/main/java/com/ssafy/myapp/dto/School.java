package com.ssafy.myapp.dto;

public class School {

	String id;
	String name;
	String type;
	String address;
	String lat;
	String lng;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public School(String id, String name, String type, String address, String lat, String lng) {
		this.id = id;
		this.name = name;
		this.type = type;
		this.address = address;
		this.lat = lat;
		this.lng = lng;
	}

	public School() {
	}

}
