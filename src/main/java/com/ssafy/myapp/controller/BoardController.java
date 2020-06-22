package com.ssafy.myapp.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.myapp.dto.Board;
import com.ssafy.myapp.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	// 게시글 조회
	@RequestMapping(value = "boardMain", method = RequestMethod.GET)
	public String showAll(Model model, Board board) throws SQLException {
		model.addAttribute("allArticle", boardService.searchAll(board)); // 처음 하우스 리스트에 갔을 때, 모든 거래정보를 가져옴.
		return "board/board";
	}

	@RequestMapping(value = "/articledetail/{no}")
	public String detail(@PathVariable int no, Model model) throws SQLException {
		model.addAttribute("detail", boardService.boardDetail(no));
		return "board/boardDetail";
	}
}
