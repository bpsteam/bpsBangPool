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


}
