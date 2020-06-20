package com.ssafy.myapp.repo;

import java.util.List;

import com.ssafy.myapp.dto.HouseDeal;

public interface SelectDao {
	public List<HouseDeal> searchByDong(String dong) throws Exception;
}
