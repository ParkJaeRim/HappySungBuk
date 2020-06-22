package com.ssafy.myapp.repo;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.myapp.dto.Board;

public interface BoardDao {

	public List<Board> searchAll(Board board) throws SQLException;

	public Board boardDeatil(int no);

}
