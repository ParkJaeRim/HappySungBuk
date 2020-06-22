package com.ssafy.myapp.dto;

public class HouseDeal  {

	private int no;
	private String dong;
	private String aptName;
	private String dealAmount;
	private int buildYear;
	private int dealYear;
	private int dealMonth;
	private int dealDay;
	private double area;
	private String jibun;
	private double lat;
	private double lng;
	private String type;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getAptName() {
		return aptName;
	}

	public void setAptName(String aptName) {
		this.aptName = aptName;
	}

	public String getDealAmount() {
		return dealAmount;
	}

	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}

	public int getBuildYear() {
		return buildYear;
	}

	public void setBuildYear(int buildYear) {
		this.buildYear = buildYear;
	}

	public int getDealYear() {
		return dealYear;
	}

	public void setDealYear(int dealYear) {
		this.dealYear = dealYear;
	}

	public int getDealMonth() {
		return dealMonth;
	}

	public void setDealMonth(int dealMonth) {
		this.dealMonth = dealMonth;
	}

	public int getDealDay() {
		return dealDay;
	}

	public void setDealDay(int dealDay) {
		this.dealDay = dealDay;
	}

	public double getArea() {
		return area;
	}

	public void setArea(double area) {
		this.area = area;
	}

	public String getJibun() {
		return jibun;
	}

	public void setJibun(String jibun) {
		this.jibun = jibun;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public HouseDeal(int no, String dong, String aptName, String dealAmount, int buildYear, int dealYear, int dealMonth,
			int dealDay, double area, String jibun, double lat, double lng, String type) {
		super();
		this.no = no;
		this.dong = dong;
		this.aptName = aptName;
		this.dealAmount = dealAmount;
		this.buildYear = buildYear;
		this.dealYear = dealYear;
		this.dealMonth = dealMonth;
		this.dealDay = dealDay;
		this.area = area;
		this.jibun = jibun;
		this.lat = lat;
		this.lng = lng;
		this.type = type;
	}

	public HouseDeal() {
	}

	@Override
	public String toString() {
		return "HouseDeal [no=" + no + ", dong=" + dong + ", aptName=" + aptName + ", dealAmount=" + dealAmount
				+ ", buildYear=" + buildYear + ", dealYear=" + dealYear + ", dealMonth=" + dealMonth + ", dealDay="
				+ dealDay + ", area=" + area + ", jibun=" + jibun + ", lat=" + lat + ", lng=" + lng + ", type=" + type
				+ "]";
	}

}
