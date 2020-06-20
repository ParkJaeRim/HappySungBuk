package com.ssafy.myapp.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.myapp.dto.PharmacyInfo;
import com.ssafy.myapp.dto.School;

@Repository
public class NearDaoImpl implements NearDao {
	String ns = "near.";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<School> findAllSchool() throws Exception {
		return sqlSession.selectList(ns + "AllSchool");
	}

	@Override
	public List<School> findElementry() throws Exception {
		return sqlSession.selectList(ns + "AllElementry");

	}

	@Override
	public List<School> findMiddle() throws Exception {
		return sqlSession.selectList(ns + "AllMiddle");
	}

	@Override
	public List<School> findHigh() throws Exception {
		return sqlSession.selectList(ns + "AllHigh");

	}

	@Override
	public List<PharmacyInfo> findPharmacy() throws Exception {
		return sqlSession.selectList(ns + "AllPharm");
	}

}
