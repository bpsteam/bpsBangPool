package com.project.bangpool.memberlevel.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.member.model.vo.Member;
import com.project.bangpool.memberlevel.model.dao.LevelDAO;
import com.project.bangpool.memberlevel.model.vo.ManageMember;

@Service("lvService")
public class LevelServiceImpl implements LevelService{
	
	@Autowired
	private LevelDAO lvDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ManageMember updateLevel(String mlCode) {
		//return lvDAO.updateLevel(sqlSession, mlCode);
		return null;
	}

	@Override
	public int getLoginCount(String mNo) {
		return lvDAO.getLoginCount(sqlSession, mNo);
	}


	@Override
	public int getWriteCount(String nickname) {
		return lvDAO.getWriteCount(sqlSession, nickname);
	}

	@Override
	public int updatelCode(HashMap<String, String> countMap) {
		return lvDAO.updatelCode(sqlSession, countMap);
	}



}
