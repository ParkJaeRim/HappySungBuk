package com.ssafy.myapp.repo;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.myapp.dto.HouseDeal;
import com.ssafy.myapp.dto.HousePageBean;
import com.ssafy.myapp.dto.PharmacyInfo;

public interface HouseDao {

	public List<HouseDeal> searchAll(HousePageBean bean) throws SQLException;

	public List<String> getAlldongName() throws SQLException;

	public HouseDeal houseDetail(int num) throws SQLException;

	public void houseDelete(int no) throws SQLException;

	public List<HouseDeal> search(String key, String word) throws SQLException;

	public List<HouseDeal> searchByDong(String dong) throws Exception;

	public List<HouseDeal> searchDongAndApt(String key, String word, String word2) throws SQLException;

	public List<HouseDeal> searchSimilar(HouseDeal hd) throws SQLException;

	// PageNavi

	public int getTotalCount(HousePageBean bean) throws SQLException;

	public void loadData();

	public ArrayList<String> listFilesForFolder(final File folder);
	
	//
	public List<PharmacyInfo> searchPharmacy(String dong) throws SQLException;
}
