package com.project.bangpool.freeboard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.common.Reply;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.freeboard.model.dao.FreeBoardDAO;
import com.project.bangpool.freeboard.model.vo.FreeBoard;
import com.project.bangpool.roommateboard.model.vo.RMBoard;

@Service("frbService")
public class FreeBoardServiceImpl implements FreeBoardService {

	@Autowired
	private FreeBoardDAO frbDAO;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<FreeBoard> selectList(PageInfo pi) {
		return frbDAO.selectList(sqlSession, pi);

	}

	@Override
	public int getListCount() {
		return frbDAO.getListCount(sqlSession);
	}
	
	@Override
	public int insertBoard(FreeBoard hb) {
		// insert시에  파일은 attachment테이블에  저장
		
		int result1 = frbDAO.insertBoard(sqlSession, hb);
		int result2  = 0;
		
		if(result1 > 0) {
			int hbId = frbDAO.selectHbId(sqlSession);	//해당 게시글번호 select 가져오기
			hb.setFrbId(hbId);
			hb.setBcode("FRBCODE");
			
			result2 = frbDAO.insertFile(sqlSession, hb);
		}
		
		return result2;
	}
	
	@Override
	public FreeBoard selectBoard(int hbId) {
		FreeBoard b = null;
		
		int result = frbDAO.addReadCount(sqlSession, hbId);
		System.out.println("result :" +result);
		if(result > 0) {
			b = frbDAO.selectBoard(sqlSession, hbId);
		}
		return b;
	}


	@Override
	public int updateBoard(FreeBoard hb) {
		// update시, 첨부파일은 attachment테이블에 저장
		
		int result1 = frbDAO.updateBoard(sqlSession, hb);
		int result2  = 0;
		
		if(result1 > 0) {
			hb.setBcode("FRBCODE");
			
			result2 = frbDAO.updateFile(sqlSession, hb);
		}
		return result2;
	}

	@Override
	public int deleteBoard(int hbId) {
		return frbDAO.deleteBoard(sqlSession, hbId);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int hbId) {
		return frbDAO.selectReplyList(sqlSession, hbId);
	}

	@Override
	public int insertReply(Reply r) {
		return frbDAO.insertReply(sqlSession, r);
	}


	@Override
	public int getSearchListCount(HashMap<String, String> searchMap) {
		return frbDAO.getSearchListCount(sqlSession, searchMap);
	}

	@Override
	public ArrayList<FreeBoard> selectSearchList(HashMap<String, String> searchMap, PageInfo pi) {
		return frbDAO.selectSearchList(sqlSession, searchMap, pi);
	}
	
	@Override
	public ArrayList<FreeBoard> selectTopList() {
		return frbDAO.selectTopList(sqlSession);
	}
	

}
