package com.project.bangpool.housemateboard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.housemateboard.model.dao.HMBoardDAO;
import com.project.bangpool.housemateboard.model.vo.HMBoard;

@Service("hbService")
public class HMBoardServiceImpl implements HMBoardService {

	@Autowired
	private HMBoardDAO bDAO;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<HMBoard> selectList() {
		return bDAO.selectList(sqlSession);

	}

}
