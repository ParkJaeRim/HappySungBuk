package com.ssafy.myapp.service;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.myapp.dto.HouseDeal;
import com.ssafy.myapp.dto.HousePageBean;
import com.ssafy.myapp.dto.PageNavigation;
import com.ssafy.myapp.dto.PharmacyInfo;
import com.ssafy.myapp.repo.HouseDao;

@Service
public class HouseServiceImpl implements HouseService {
	@Autowired
	private HouseDao dao;

	@Override
	public List<HouseDeal> searchAll(HousePageBean bean) throws Exception {
		return dao.searchAll(bean);
	}

	@Override
	public HouseDeal houseDetail(int num) throws SQLException {
		return dao.houseDetail(num);
	}

	@Override
	@Transactional
	public void houseDelete(int no) throws SQLException {
		dao.houseDelete(no);
	}

	@Override
	public List<String> getAlldongName() throws Exception {
		return dao.getAlldongName();
	}

	@Override
	public List<HouseDeal> search(String key, String word) throws SQLException {
		return dao.search(key, word);
	}

	@Override
	public List<HouseDeal> searchDongAndApt(String key, String word, String word2) throws SQLException {
		return dao.searchDongAndApt(key, word, word2);
	}

	@Override
	public List<HouseDeal> searchByDong(String dong) throws Exception {
		return dao.searchByDong(dong);

	}

	@Override
	public ArrayList<String> listFilesForFolder(File folder) {
		// TODO Auto-generated method stub`
		return null;
	}

	// pageNavigation
	@Override
	public List<HouseDeal> listArticle(int currentPage, int sizePerPage, String key, String word, HousePageBean bean)
			throws Exception {
		return null;
	}

	@Override
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, HousePageBean bean) throws Exception {
		PageNavigation pageNavigation = new PageNavigation();
		int naviSize = 10; // 페이지 갯수

		pageNavigation.setCurrentPage(currentPage); //
		pageNavigation.setNaviSize(naviSize);

		int totalCount = dao.getTotalCount(bean); // 총 게시글수
		pageNavigation.setTotalCount(totalCount);

		int totalPageCount = (totalCount - 1) / sizePerPage + 1; // 총 페이지수
		pageNavigation.setTotalPageCount(totalPageCount);

		boolean startRange = currentPage <= naviSize; // startRange true : 이전을 누를수 없음
		pageNavigation.setStartRange(startRange);

		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage; // endRange true : 다음을 누를수 없음
		pageNavigation.setEndRange(endRange);

		pageNavigation.makeNavigator();
		return pageNavigation;
	}

	@Override
	public List<HouseDeal> searchSimilar(HouseDeal hd) throws SQLException {
		return dao.searchSimilar(hd);
	}

	//
	@Override
	public List<PharmacyInfo> searchPharmacy(String dong) throws Exception {
		return dao.searchPharmacy(dong);

	}

}