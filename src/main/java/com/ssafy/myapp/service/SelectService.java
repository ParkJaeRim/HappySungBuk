package com.ssafy.myapp.service;

import java.util.List;

import com.ssafy.myapp.dto.HouseDeal;

public interface SelectService {
	public List<HouseDeal> searchByDong(String dong) throws Exception;

}
