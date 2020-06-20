package com.ssafy.myapp.service;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.myapp.dto.HouseDeal;
import com.ssafy.myapp.dto.HousePageBean;
import com.ssafy.myapp.dto.PageNavigation;
import com.ssafy.myapp.dto.PharmacyInfo;

public interface HouseService {

	public List<HouseDeal> searchAll(HousePageBean bean) throws Exception;

	public List<String> getAlldongName() throws Exception; // 동 이름 얻어오기

	public HouseDeal houseDetail(int no) throws SQLException;

	public void houseDelete(int no) throws SQLException;

	public List<HouseDeal> search(String key, String word) throws SQLException;

	public List<HouseDeal> searchDongAndApt(String key, String word, String word2) throws SQLException;

	public List<HouseDeal> searchByDong(String dong) throws Exception; // 동별검색, 전체 검색

	public List<HouseDeal> searchSimilar(HouseDeal hd) throws SQLException;
	// pageNavigation

	public ArrayList<String> listFilesForFolder(final File folder);

	public List<HouseDeal> listArticle(int currentPage, int sizePerPage, String key, String word, HousePageBean bean)
			throws Exception;

	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, HousePageBean bean) throws Exception;

	//
	public List<PharmacyInfo> searchPharmacy(String dong) throws Exception;
}
