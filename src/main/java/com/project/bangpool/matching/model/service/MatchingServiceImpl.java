package com.project.bangpool.matching.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.freshmanmateboard.model.vo.FMBoard;
import com.project.bangpool.housemateboard.model.vo.HMBoard;
import com.project.bangpool.matching.model.dao.MatchingDAO;
import com.project.bangpool.roommateboard.model.vo.RMBoard;

@Service("mcService")
public class MatchingServiceImpl implements MatchingService {
	
	@Autowired
	private MatchingDAO mcDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<RMBoard> selectRMatching(HashMap<String, String> matchingMap) {
		
		return mcDAO.selectRMatching(sqlSession, matchingMap);
	}

	@Override
	public ArrayList<HMBoard> selectHMatching(HashMap<String, String> matchingMap) {
		return mcDAO.selectHMatching(sqlSession, matchingMap);
	}

	@Override
	public ArrayList<FMBoard> selectFMatching(HashMap<String, String> matchingMap) {
		return mcDAO.selectFMatching(sqlSession, matchingMap);
	}
	
	

}
