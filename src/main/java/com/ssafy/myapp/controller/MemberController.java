package com.ssafy.myapp.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.myapp.dto.MemberInfo;
import com.ssafy.myapp.service.HouseService;
import com.ssafy.myapp.service.LoginService;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private LoginService loginService;

	// 메인으로
	@RequestMapping(value = "backtoMain", method = RequestMethod.GET)
	public String goMain() {
		return "redirect:/home";
	}

	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("HOME입니다 ! " + new Date());
		model.addAttribute("head", "WELCOME");
		return "main";
	}

	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model) {
		return "user/login";
	}

	@RequestMapping(value = "main", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginAf(HttpServletRequest request, @RequestParam Map<String, String> map, Model model)
			throws SQLException, IOException {
		MemberInfo login = loginService.checkMember(map);
		logger.info("로그인 과정 中");
		if (login != null && !login.getId().equals("")) {
			logger.info("로그인 성공");
			request.getSession().setAttribute("login", login);
			request.getSession().setMaxInactiveInterval(10 * 60);
			model.addAttribute("head", "WELCOME");
			return "main";
		} else {
			logger.info("로그인 실패");
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, Model model) {
		logger.info("로그아웃");
		request.getSession().invalidate();
		model.addAttribute("head", "WELCOME");
		return "main";
	}

	// 회원정보 수정
	@RequestMapping(value = "mvupdate", method = RequestMethod.GET)
	public String mvUpdate() {
		logger.info("업데이트로");
		return "user/memberUpdateForm";
	}

	@RequestMapping(value = "update")
	public String update(@ModelAttribute MemberInfo memberinfo) throws SQLException {
		loginService.updateMember(memberinfo);
		return "redirect:/login";
	}

	// 회원 가입
	@RequestMapping(value = "mvregister", method = RequestMethod.GET)
	public String getRegister(Model model) {
		logger.info("등록으로");
		return "user/join";
	}

	@RequestMapping(value = "register", method = { RequestMethod.GET, RequestMethod.POST })
	public String postRegister(@ModelAttribute MemberInfo memberinfo) throws Exception {
		logger.info("register폼 전송! ");
		loginService.addMember(memberinfo);
		System.out.println(memberinfo.getName());
		return "redirect:/backtoMain";
	}
}
