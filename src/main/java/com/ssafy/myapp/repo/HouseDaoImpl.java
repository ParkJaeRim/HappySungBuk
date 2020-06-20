package com.ssafy.myapp.repo;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.myapp.dto.HouseDeal;
import com.ssafy.myapp.dto.HousePageBean;
import com.ssafy.myapp.dto.PharmacyInfo;

@Repository
public class HouseDaoImpl implements HouseDao {
	String ns = "house.";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HouseDeal> searchAll(HousePageBean bean) throws SQLException {
		return sqlSession.selectList(ns + "houseList", bean);
	}

	@Override
	public HouseDeal houseDetail(int num) throws SQLException {
		return sqlSession.selectOne(ns + "houseDetail", num);
	}

	@Override
	public void houseDelete(int no) throws SQLException {
		sqlSession.delete(ns + "houseDelete", no);
	}

	@Override
	public List<HouseDeal> search(String key, String word) throws SQLException {
		word = "%" + word + "%";
		HouseDeal housedeal = new HouseDeal();
		if (key.equals("aptName")) {
			housedeal.setAptName(word);
		} else {
			housedeal.setDong(word);
		}
		return sqlSession.selectList(ns + "houseSearch", housedeal);
	}

	@Override
	public List<HouseDeal> searchDongAndApt(String key, String word, String word2) throws SQLException {
		word = "%" + word + "%";
		HouseDeal housedeal = new HouseDeal();
		if (key.equals("aptName")) {
			housedeal.setAptName(word);
			housedeal.setDong(word2);
		}
		return sqlSession.selectList(ns + "searchDongAndApt", housedeal);
	}

	@Override
	public List<String> getAlldongName() throws SQLException {
		System.out.println("HI!!!!");
		return sqlSession.selectList(ns + "getAlldongName");
	}

	@Override
	public List<HouseDeal> searchByDong(String dong) throws Exception {
		return sqlSession.selectList(ns + "searchByDong", dong);
	}

	@Override
	public void loadData() {

	}

	@Override
	public ArrayList<String> listFilesForFolder(File folder) {
		return null;
	}

	@Override
	public int getTotalCount(HousePageBean bean) throws SQLException {
		int cnt = 0;
		String dong = bean.getDong();
		String aptName = bean.getAptname();
		if (dong != null) {
			dong = dong.trim();
		}
		if (aptName != null) {
			aptName = aptName.trim();
		}
		bean.setDong(dong);
		bean.setAptname(aptName);
		return sqlSession.selectOne(ns + "getTotalCount", bean);
	}

	@Override
	public List<HouseDeal> searchSimilar(HouseDeal hd) throws SQLException {
		return sqlSession.selectList(ns +"searchSimilar",hd);
	}
	
	//
	@Override
	   public List<PharmacyInfo> searchPharmacy(String dong) throws SQLException {
	      return sqlSession.selectList("pharmacy.pharmacyAtDong", dong);
	   }

}