package com.project.bangpool.roommateboard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.common.Reply;
import com.project.bangpool.common.SearchCondition;
import com.project.bangpool.common.page.PageInfo;
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
		// attachment 저장
		int result1 = rbDAO.insertBoard(sqlSession, b);
		int result2 = 0;
		
		if(result1 > 0) {
			int rbId = rbDAO.selectBno(sqlSession);
			
			b.setRbId(rbId);
			b.setBcode("RMBCODE");
			
			result2 = rbDAO.insertFile(sqlSession, b);
		}
		
		return result2;
		//return rbDAO.insertBoard(sqlSession, b);
	}

	@Override
	public ArrayList<RMBoard> selectList(PageInfo pi, String loc) {
		return rbDAO.selectList(sqlSession, pi, loc);
	}

	@Override
	public RMBoard selectBoard(int rbId) {
		RMBoard b = null;
		int result = rbDAO.addReadCount(sqlSession, rbId);
		System.out.println("rbService result값 ? "+result);
		
		if(result > 0) {
			b = rbDAO.selectBoard(sqlSession, rbId);
			System.out.println("rbService b?"+b);
		}
		return b;
		
	}

	@Override
	public int updateBoard(RMBoard b) {
		// 첨부파일 attachment 테이블
		
		System.out.println("update?");
		
		int result1 = rbDAO.updateBoard(sqlSession, b);
		int result2 = 0;
		
		if(result1 > 0) {
			b.setBcode("RMBCODE");
			result2 = rbDAO.updateFile(sqlSession, b);
		}
		return result2;
	}

	@Override
	public ArrayList<Reply> selectReplyList(int rbId) {
		return rbDAO.selectReplyList(sqlSession, rbId);
	}

	@Override
	public int insertReply(Reply r) {
		return rbDAO.insertReply(sqlSession, r);
	}

	@Override
	public int deleteBoard(int rbId) {
		return rbDAO.deleteBoard(sqlSession, rbId);
	}

	@Override
	public int getListCount(String loc) {
		return rbDAO.getListCount(sqlSession, loc);
	}

	@Override
	public int getSearchResultListCount(SearchCondition sc) {
		return rbDAO.getSearchResultListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<RMBoard> selectSearchResultList(SearchCondition sc, PageInfo pi) {
		return rbDAO.selectSearchResultList(sqlSession, sc, pi);
	}

	@Override
	public ArrayList<RMBoard> selectTopList() {
		return rbDAO.selectTopList(sqlSession);
	}
	
	
	////////////
//	public int getSearchResultListCount(SearchCondition sc) throws BoardException {
//		SqlSession session = getSqlSession();
//		
//		int listCount = new BoardDao().getSearchResultListCount(session, sc);
//		
//		session.close();
//		
//		return listCount;
//	}
//
//	public ArrayList<Board> selectSearchResultList(SearchCondition sc, PageInfo pi) throws BoardException {
//		SqlSession session = getSqlSession();
//		
//		ArrayList<Board> list = new BoardDao().selectSearchResultList(session, sc, pi);
//		
//		session.close();
//		
//		return list;
//	}

}
