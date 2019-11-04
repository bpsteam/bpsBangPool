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
	private HMBoardDAO hbDAO;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<HMBoard> selectList() {
		return hbDAO.selectList(sqlSession);

	}

	@Override
	public HMBoard selectBoard(int hbId) {
		HMBoard b = null;
		
		int result = hbDAO.addReadCount(sqlSession, hbId);
		System.out.println("result :" +result);
		if(result > 0) {
			b = hbDAO.selectBoard(sqlSession, hbId);
		}
		return b;
	}

	@Override
	public int insertBoard(HMBoard hb) {
		return hbDAO.insertBoard(sqlSession, hb);
	}

}
