package com.project.bangpool.matching.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.roommateboard.model.vo.RMBoard;

@Repository("mcDAO")
public class MatchingDAO {

	public ArrayList<RMBoard> selectMatching(SqlSessionTemplate sqlSession, HashMap<String, String> matchingMap) {
		System.out.println("matching dao");
		return (ArrayList)sqlSession.selectList("rmboardMapper.selectMatching", matchingMap);
	}

}
