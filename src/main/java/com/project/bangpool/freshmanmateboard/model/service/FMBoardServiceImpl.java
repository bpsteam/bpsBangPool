package com.project.bangpool.freshmanmateboard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.comment.model.vo.Reply;
import com.project.bangpool.common.PageInfo;
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

	

//	@Override
//	public ArrayList<PiBoard> selectPiList(String location, PageInfo pi) {
//		return fbDAO.selectList(sqlSession, location, pi);
//	}
//	
	@Override
	public ArrayList<FMBoard> selectList(String location, PageInfo pi) {
		return fbDAO.selectList(sqlSession, location, pi);
	}
	


	@Override
	public FMBoard selectBoard(int fbId) {
		
		FMBoard b = null;
		
		int result = fbDAO.addReadCount(sqlSession, fbId);
		
		if(result>0) {
			b = fbDAO.selectBoard(sqlSession, fbId);
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


	@Override
	public int insertReply(Reply r) {
		return fbDAO.insertReply(sqlSession, r);
	}


	@Override
	public ArrayList<Reply> selectReplyList(int fbId) {
		return fbDAO.selectReplyList(sqlSession, fbId);
	}



	@Override
	public int getListCount(String location) {
		return fbDAO.getListCount(sqlSession, location);
	}



	@Override
	public int getSearchListCount(HashMap<String, String> searchMap) {
		return fbDAO.getSearchListCount(sqlSession, searchMap);
	}



	@Override
	public ArrayList<FMBoard> searchList(HashMap<String, String> searchMap, PageInfo pi) {
		return fbDAO.getSearchList(sqlSession, searchMap, pi);
	}



	@Override
	public int deleteReply(int rId) {
		return fbDAO.deleteReply(sqlSession, rId);
	}







}
