package com.ssafy.myapp.repo;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.myapp.dto.Board;

public interface BoardDao {

	public List<Board> searchAll(Board board) throws SQLException;

	public Board boardDeatil(int no);

	public void updates(Board board);

	public void create(Board board);

	public int countArticle();

}
