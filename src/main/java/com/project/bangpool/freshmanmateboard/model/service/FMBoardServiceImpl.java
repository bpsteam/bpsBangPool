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
		
		int result2 = 0;
		
		int result = bDAO.insertBoard(sqlSession, b);
		
		if(result>0) {
			int fbId = bDAO.selectCurrentBno(sqlSession);
			System.out.println("번호받아져왔니? : " +fbId);
			
			b.setFbId(fbId);
			b.setBcode("FMBCODE");
			System.out.println("보드 전체 출력 : "+ b);
			
			result2 = bDAO.insertFile(sqlSession, b); 
		}
		
		return result2;
		
//		return  bDAO.insertBoard(sqlSession, b);
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


	@Override
	public int deleteBoard(int fbId) {
		return bDAO.deleteBoard(sqlSession, fbId);
	}


	@Override
	public int updateBoard(FMBoard b) {
		
		int result2 = 0;
		
		int result = bDAO.updateBoard(sqlSession, b);
		
		if(result > 0) {
			b.setBcode("FMBCODE");
			result2 = bDAO.updateFile(sqlSession, b);
		}
		return result2;
	}


}
