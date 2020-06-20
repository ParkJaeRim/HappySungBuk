package com.ssafy.myapp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.myapp.service.NearService;

@Controller
public class NearController {

	@Autowired
	NearService nearService;

	@RequestMapping(value = "/school")
	public String goSchool(HttpServletRequest request, Model model) throws Exception {

		// 학교 정보
		model.addAttribute("findschoolAll", nearService.findAllSchool());
		model.addAttribute("findElementry", nearService.findElementry());
		model.addAttribute("findMiddle", nearService.findMiddle());
		model.addAttribute("findHigh", nearService.findHigh());

		return "near/near";
	}
	@RequestMapping(value = "/pharm")
	public String goPharm(HttpServletRequest request, Model model) throws Exception {
		// 약국 정보
		model.addAttribute("findPharm", nearService.findPharmacy());
		
		return "near/pharm";
	}
	@RequestMapping(value = "/com")
	public String goCom(HttpServletRequest request, Model model) throws Exception {
		
		return "near/com";
	}
}
