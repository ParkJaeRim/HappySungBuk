package com.ssafy.myapp.service;

import java.sql.SQLException;
import java.util.Map;

import com.ssafy.myapp.dto.MemberInfo;

public interface LoginService {

	void addMember(MemberInfo member) throws SQLException;

	public MemberInfo checkMember(Map<String, String> map) throws SQLException;

	void updateMember(MemberInfo member) throws SQLException;

}
