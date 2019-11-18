package com.project.bangpool.secondHandBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.common.Reply;
import com.project.bangpool.secondHandBoard.model.dao.SecondHandBoardDAO;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.roommateboard.model.vo.RMBoard;
import com.project.bangpool.secondHandBoard.model.vo.SecondHandBoard;

@Service("shbService")
public class SecondHandBoardServiceImpl implements SecondHandBoardService {
	
	@Autowired
	private SecondHandBoardDAO shbDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	// root-context 에 있는 sqlSession을 말하는거다. 

	@Override
	public int getListCount() {
		return shbDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<SecondHandBoard> SelectList(PageInfo pi) {
		return shbDAO.selectList(sqlSession,pi);
	}

	@Override
	public int insertBoard(SecondHandBoard shb) {
		return shbDAO.insertBoard(sqlSession,shb);
	}

	@Override
	public SecondHandBoard selectBoard(int shbId) {
		
		SecondHandBoard shb = null;
		
		int result = shbDAO.addReadCount(sqlSession, shbId);
		
		if(result>0) {
			return shbDAO.selectBoard(sqlSession, shbId);			
		}
		
		return shb;
	}

	@Override
	public int updateBoard(SecondHandBoard shb) {
		return shbDAO.updateBoard(sqlSession, shb);
	}

	@Override
	public int deleteBoard(int shbId) {
		return shbDAO.deleteBoard(sqlSession,shbId);
	}

	@Override
	public ArrayList<Reply> selectReply(int shbId) {
		return shbDAO.selectReply(sqlSession,shbId);
	}

	@Override
	public int insertReply(Reply reply) {
		return shbDAO.insertReply(sqlSession, reply);
	}

	@Override
	public int deleteReply(int rId) {
		return shbDAO.deleteReply(sqlSession, rId);
	}

	@Override
	public ArrayList<SecondHandBoard> sofaList(PageInfo pi) {
		return shbDAO.sofaList(sqlSession,pi);
	}
	
	@Override
	public ArrayList<SecondHandBoard> makeupList(PageInfo pi) {
		return shbDAO.makeupList(sqlSession,pi);
	}

	@Override
	public ArrayList<SecondHandBoard> deskList(PageInfo pi) {
		return shbDAO.deskList(sqlSession,pi);
	}

	@Override
	public ArrayList<SecondHandBoard> tableList(PageInfo pi) {
		return shbDAO.tableList(sqlSession,pi);
	}
	@Override
	public ArrayList<SecondHandBoard> displayList(PageInfo pi) {
		return shbDAO.displayList(sqlSession,pi);
	}
	
	@Override
	public ArrayList<SecondHandBoard> selectTopList() {
		return shbDAO.selectTopList(sqlSession);
	}
	
	
	
	
	
	
	
	
}
