package com.project.bangpool.matching.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.matching.model.dao.MatchingDAO;
import com.project.bangpool.roommateboard.model.vo.RMBoard;

@Service("mcService")
public class MatchingServiceImpl implements MatchingService {
	
	@Autowired
	private MatchingDAO mcDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<RMBoard> selectMatching(HashMap<String, String> matchingMap) {
		
		return mcDAO.selectMatching(sqlSession, matchingMap);
	}
	
	

}
