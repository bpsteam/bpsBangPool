package com.project.bangpool.roommateboard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.comment.model.vo.Reply;
import com.project.bangpool.freshmanmateboard.model.vo.PageInfo;
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
		return rbDAO.insertBoard(sqlSession, b);
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
	public int getListCount() {
		return rbDAO.getListCount(sqlSession);
	}
	

}
