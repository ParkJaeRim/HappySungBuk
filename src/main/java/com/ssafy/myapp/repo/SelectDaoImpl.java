package com.ssafy.myapp.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.myapp.dto.HouseDeal;

@Repository
public class SelectDaoImpl implements SelectDao {
	String ns = "house.";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HouseDeal> searchByDong(String dong) throws Exception {
		return sqlSession.selectList(ns + "searchByDong",dong);
	}

}
