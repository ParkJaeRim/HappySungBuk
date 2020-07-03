package com.ssafy.myapp.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.myapp.dto.Board;

public interface BoardService {

	List<Board> searchAll(Board board) throws SQLException;

	Board boardDetail(int no);

	void updates(Board board);

	void create(Board board);

	int countArticle();

	void deleted(int no);

}
