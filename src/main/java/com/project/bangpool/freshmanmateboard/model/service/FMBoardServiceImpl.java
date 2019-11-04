package com.project.bangpool.freshmanmateboard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.freshmanmateboard.model.dao.FMBoardDAO;
import com.project.bangpool.freshmanmateboard.model.vo.FMBoard;

@Service("fbService")
public class FMBoardServiceImpl implements FMBoardService {
	
	@Autowired
	private FMBoardDAO fbDAO ;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public int insertBoard(FMBoard b) {
		
		int result2 = 0;
		
		int result = fbDAO.insertBoard(sqlSession, b);
		
		if(result>0) {
			int fbId = fbDAO.selectCurrentBno(sqlSession);
			System.out.println("번호받아져왔니? : " +fbId);
			
			b.setFbId(fbId);
			b.setBcode("FMBCODE");
			System.out.println("보드 전체 출력 : "+ b);
			
			result2 = fbDAO.insertFile(sqlSession, b); 
		}
		
		return result2;
		
//		return  bDAO.insertBoard(sqlSession, b);
	}


	@Override
	public ArrayList<FMBoard> selectList() {
		return fbDAO.selectList(sqlSession);
	}


	@Override
	public FMBoard selectBoard(int bId) {
		
		FMBoard b = null;
		
		int result = fbDAO.addReadCount(sqlSession, bId);
		
		if(result>0) {
			b = fbDAO.selectBoard(sqlSession, bId);
		}
		
		return b;
	}


	@Override
	public int deleteBoard(int fbId) {
		return fbDAO.deleteBoard(sqlSession, fbId);
	}


	@Override
	public int updateBoard(FMBoard b) {
		
		int result2 = 0;
		
		int result = fbDAO.updateBoard(sqlSession, b);
		
		if(result > 0) {
			b.setBcode("FMBCODE");
			result2 = fbDAO.updateFile(sqlSession, b);
		}
		return result2;
	}


}
