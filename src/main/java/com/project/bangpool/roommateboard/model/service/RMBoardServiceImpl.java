package com.project.bangpool.roommateboard.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.roommateboard.model.dao.RMBoardDAO;
import com.project.bangpool.roommateboard.model.vo.RMBoard;

@Service("rbService")
public class RMBoardServiceImpl implements RMBoardService{
	
	@Autowired
	private RMBoardDAO rbDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertBoard(RMBoard b) {
		System.out.println("rbService ???????");
		return rbDAO.insertBoard(sqlSession, b);
	}

}
