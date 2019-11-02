package com.project.bangpool.freshmanmateboard.model.service;

import java.util.ArrayList;

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


	@Override
	public ArrayList<FMBoard> selectList() {
		return bDAO.selectList(sqlSession);
	}


	@Override
	public FMBoard selectBoard(int bId) {
		
		FMBoard b = null;
		
		int result = bDAO.addReadCount(sqlSession, bId);
		
		if(result>0) {
			b = bDAO.selectBoard(sqlSession, bId);
		}
		
		return b;
	}


}
