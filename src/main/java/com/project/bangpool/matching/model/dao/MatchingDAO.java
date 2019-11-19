package com.project.bangpool.matching.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.freshmanmateboard.model.vo.FMBoard;
import com.project.bangpool.housemateboard.model.vo.HMBoard;
import com.project.bangpool.roommateboard.model.vo.RMBoard;

@Repository("mcDAO")
public class MatchingDAO {

	public ArrayList<RMBoard> selectRMatching(SqlSessionTemplate sqlSession, HashMap<String, String> matchingMap) {
		System.out.println("matching dao");
		return (ArrayList)sqlSession.selectList("rmboardMapper.selectRMatching", matchingMap);
	}

	public ArrayList<HMBoard> selectHMatching(SqlSessionTemplate sqlSession, HashMap<String, String> matchingMap) {
		return (ArrayList)sqlSession.selectList("hmboardMapper.selectHMatching", matchingMap);
	}

	public ArrayList<FMBoard> selectFMatching(SqlSessionTemplate sqlSession, HashMap<String, String> matchingMap) {
		return (ArrayList)sqlSession.selectList("fmboardMapper.selectFMatching", matchingMap);
	}

}
