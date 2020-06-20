package com.ssafy.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.myapp.dto.PharmacyInfo;
import com.ssafy.myapp.dto.School;
import com.ssafy.myapp.repo.NearDao;

@Service
public class NearServiceImpl implements NearService {
	@Autowired
	private NearDao nearDao;

	@Override
	public List<School> findAllSchool() throws Exception {
		return nearDao.findAllSchool();
	}

	@Override
	public List<School> findElementry() throws Exception {
		return nearDao.findElementry();
	}

	@Override
	public List<School> findMiddle() throws Exception {
		return nearDao.findMiddle();
	}

	@Override
	public List<School> findHigh() throws Exception {
		return nearDao.findHigh();
	}

	@Override
	public List<PharmacyInfo> findPharmacy() throws Exception {
		return nearDao.findPharmacy();
	}

}
