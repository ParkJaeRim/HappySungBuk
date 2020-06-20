package com.ssafy.myapp.repo;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.myapp.dto.MemberInfo;

@Repository
public class MemberDaoImpl implements MemberDao {

	String ns = "login.";
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void addMember(MemberInfo member) throws SQLException {
		sqlSession.insert(ns + "addMember", member);
	}

	@Override
	public MemberInfo checkMember(Map<String, String> map) {
		return sqlSession.selectOne(ns + "checkMember", map);
	}

	@Override
	public void updateMember(MemberInfo member) throws SQLException {
		sqlSession.update(ns + "updateMember", member);
	}

}
