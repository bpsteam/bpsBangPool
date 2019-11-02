package com.project.bangpool.freshmanmateboard.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.freshmanmateboard.model.dao.FMBoardDAO;
import com.project.bangpool.freshmanmateboard.model.vo.FMBoard;

@Service("bService")
public class FMBoardServiceImpl implements FMBoardService {
	
	@Autowired
	private FMBoardDAO bDAO ;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public int insertBoard(FMBoard b) {
		return bDAO.insertBoard(sqlSession, b);
	}


}
