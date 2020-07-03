package com.ssafy.myapp.repo;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.myapp.dto.Board;

@Repository
public class BoardDaoImpl implements BoardDao {
	String ns = "board.";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Board> searchAll(Board board) throws SQLException {
		return sqlSession.selectList(ns + "SearchallArticle", board);
	}

	@Override
	public Board boardDeatil(int no) {
		return sqlSession.selectOne(ns + "detail", no);
	}

	@Override
	public void updates(Board board) {
		sqlSession.selectOne(ns + "updateArticle", board);
	}

	@Override
	public void create(Board board) {
		sqlSession.selectOne(ns + "createArticle", board);

	}

	@Override
	public int countArticle() {
		return sqlSession.selectOne(ns + "count");
	}

	@Override
	public void deleted(int no) {
		sqlSession.selectOne(ns + "deleteArticle", no);
	}

}