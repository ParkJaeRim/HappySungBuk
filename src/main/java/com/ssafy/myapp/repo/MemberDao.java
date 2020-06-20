package com.ssafy.myapp.repo;

import java.sql.SQLException;
import java.util.Map;

import com.ssafy.myapp.dto.MemberInfo;

public interface MemberDao {

	void addMember(MemberInfo member) throws SQLException;

	MemberInfo checkMember(Map<String, String> map) throws SQLException;

	void updateMember(MemberInfo member) throws SQLException;

}