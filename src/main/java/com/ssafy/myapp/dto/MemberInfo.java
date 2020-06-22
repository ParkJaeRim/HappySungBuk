package com.ssafy.myapp.dto;

public class MemberInfo  {

	/** 아이디 */
	private String id;
	/** 비번 */
	private String password;
	/** 이름 */
	private String name;
	/** 주소 */
	private String address;
	/** 번호 */
	private String phone;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "MemberInfo [id=" + id + ", password=" + password + ", name=" + name + ", address=" + address
				+ ", phone=" + phone + "]";
	}

}
