package com.ssafy.myapp.service;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.myapp.dto.MemberInfo;
import com.ssafy.myapp.repo.MemberDao;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private MemberDao memberDAO;

	@Override
	@Transactional
	public void addMember(MemberInfo member) throws SQLException {
		memberDAO.addMember(member);
	}

	@Override
	public MemberInfo checkMember(Map<String, String> map) throws SQLException {
		return memberDAO.checkMember(map);
	}

	@Override
	public void updateMember(MemberInfo member) throws SQLException {
		memberDAO.updateMember(member);
		
	}

}
