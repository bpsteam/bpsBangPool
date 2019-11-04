package com.project.bangpool.roommateboard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.roommateboard.model.vo.RMBoard;

@Repository("rbDAO")
public class RMBoardDAO {
	
	
	public int insertBoard(SqlSessionTemplate sqlSession, RMBoard b) {
		System.out.println("bDAO??????");
		return sqlSession.insert("rmboardMapper.insertBoard", b);
		
	}
	
	

}
