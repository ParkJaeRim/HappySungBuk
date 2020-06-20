package com.ssafy.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.myapp.dto.HouseDeal;
import com.ssafy.myapp.repo.SelectDao;

@Service
public class SelectServiceImpl implements SelectService {
	@Autowired
	private SelectDao selectdao;

	@Override
	public List<HouseDeal> searchByDong(String dong) throws Exception {
		return selectdao.searchByDong(dong);

	}

}
