package com.ssafy.myapp.controller;

public class HappyHouseException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	public HappyHouseException() {
		super("데이타를 처리 중 오류 발생");
	}

	public HappyHouseException(String msg) {
		super(msg);
	}

}
