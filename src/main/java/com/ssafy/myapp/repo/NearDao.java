package com.ssafy.myapp.repo;

import java.util.List;

import com.ssafy.myapp.dto.PharmacyInfo;
import com.ssafy.myapp.dto.School;

public interface NearDao {

	public List<School> findAllSchool() throws Exception;

	public List<School> findElementry() throws Exception;

	public List<School> findMiddle() throws Exception;

	public List<School> findHigh() throws Exception;

	
	public List<PharmacyInfo> findPharmacy() throws Exception;

}
