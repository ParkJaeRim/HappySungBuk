package com.ssafy.myapp.controller;

import java.sql.SQLException;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.myapp.dto.HouseDeal;
import com.ssafy.myapp.dto.HousePageBean;
import com.ssafy.myapp.dto.PageNavigation;
import com.ssafy.myapp.service.HouseService;

@Controller
public class HouseController {

	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);

	@Autowired
	HouseService houseService;

	// 하우스 리스트로 갈 때마다 호출되는 함수
	@RequestMapping(value = "/houselist", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(HousePageBean bean, @RequestParam("pg") int currentPage, Model model) throws Exception {
		logger.info("Welcome MainController houselist! " + new Date());
		logger.info("currentPage : " + currentPage);
//			HousePageBean bean = new HousePageBean();
		logger.info("*****************bean : " + bean.toString());
		int[] check = bean.getCheck();
		String key = bean.getKey();
		String word = bean.getWord();
		String dongkey = bean.getDongkey();
		logger.info("key : " + key);
		logger.info("word : " + word);
		if (check == null || check.length == 0) {
			check = new int[] { 1, 2, 3, 4 };
		}
		bean.setSearchType(check);
		bean.setCheck(check);
		logger.info("check length : " + check.length);
		if (dongkey != null && dongkey != "") {
			key = "dong";
			word = dongkey;
			bean.setWord(word);
		}
		if (key != null) {
			if (key.equals("dong")) {
				bean.setDong(word);
			} else if (key.equals("aptName")) {
				bean.setAptname(word);
			}
		}
		bean.setCurrentpage((currentPage - 1) * 10);
		bean.setKey(key);
		PageNavigation pageNavigation = houseService.makePageNavigation(currentPage, 10, bean);
		model.addAttribute("navigation", pageNavigation);
		model.addAttribute("option", houseService.getAlldongName()); // select박스에 담기 위해 모든 동이름을 가져옴
		model.addAttribute("findhouse", houseService.searchAll(bean)); // 처음 하우스 리스트에 갔을 때, 모든 거래정보를 가져옴.
		model.addAttribute("housebean", bean);
		model.addAttribute("findPharmacy", houseService.searchPharmacy(bean.getDong()));

		return "houseinfo/houseinfo";
	}

	@RequestMapping(value = "/backtoHouseList", method = RequestMethod.GET)
	public String backtoHouseList() {
		return "redirect:/houselist";
	}

	// selectbox에서 선택한 동을 검색하는 함수
	@RequestMapping(value = "/searchByDong", method = { RequestMethod.GET, RequestMethod.POST })
	public String dongSearch(Model model, String dong) throws Exception {
		// 동이름을 토대로 검색하여 findhouse라는 객체에 담아주어 dong.jsp에 findhouse라는 이름으로 보내줌
		model.addAttribute("findhouse", houseService.searchByDong(dong));
		model.addAttribute("option", houseService.getAlldongName()); // select박스에 담기 위해 모든 동이름을 가져옴

		// 위의 경우 여러 row가 return 되어 , 동만 뽑아내기에 적절치 않아. sdong이라는 임의의 이름으로 동이름 하나만 뽑아주어
		// sdong으로 dong.jsp에 넘겨줌.
		model.addAttribute("sdong", dong);
		return "houseinfo/dong";
	}

	// no에 따른 houdsedetail 페이지 보여줌
	@RequestMapping(value = "/housedetail/{no}")
	public String detail(@PathVariable int no, String dealAmount, String area, Model model) throws SQLException {
		model.addAttribute("findhouse", houseService.houseDetail(no));
		HouseDeal hd = new HouseDeal();
		hd.setDealAmount(dealAmount);
		double darea = Double.parseDouble(area);
		hd.setArea(darea);
		model.addAttribute("recommend", houseService.searchSimilar(hd));

		return "houseinfo/housefind";
	}

	@RequestMapping(value = "/recommend", method = RequestMethod.GET)
	public String recommend(String dealAmount, String area, Model model) throws SQLException {
		logger.info("RECOMMEND " + new Date());
		HouseDeal hd = new HouseDeal();
		hd.setDealAmount(dealAmount);
		double darea = Double.parseDouble(area);
		hd.setArea(darea);
		model.addAttribute("recommend", houseService.searchSimilar(hd));
		return "houseinfo/recommend";
	}

	// 큰 검색창(원래 있던 검색창)에서 동으로 검색하는지 아파트로 검색하는지
	@RequestMapping(value = "/housesearch", method = RequestMethod.POST)
	public String search(String key, String word, Model model) throws SQLException {
		model.addAttribute("findhouse", houseService.search(key, word));
		return "houseinfo/houseinfo";
	}

	// dong.jsp에서 작동하는 함수 , 특정 동에 있는 아파트이름을 검색할 때 사용
	@RequestMapping(value = "/dongAndAptlist", method = RequestMethod.POST)
	public String dongAndAptList(String key, String word, String word2, Model model) throws SQLException {
		System.out.println(key + " " + word + " " + word2);
		model.addAttribute("findhouse", houseService.searchDongAndApt(key, word, word2));
		// key는 동을 검색하는지 / 전체 검색을 하는지 , word는 검색 키워드, word2는 동이름
		return "houseinfo/houseinfo";
	}
}