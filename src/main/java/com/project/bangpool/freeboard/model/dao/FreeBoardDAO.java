package com.project.bangpool.freeboard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.common.Reply;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.freeboard.model.vo.FreeBoard;

@Repository("frbDAO")
public class FreeBoardDAO {

	public ArrayList<FreeBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("freeboardMapper.selectList", null, rowBounds);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("freeboardMapper.getListCount");
	}
	
	public int insertBoard(SqlSessionTemplate sqlSession, FreeBoard hb) {
		return sqlSession.insert("freeboardMapper.insertBoard", hb);
	}
	
	public int selectHbId(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("freeboardMapper.selectHbId");
	}
	
	public int insertFile(SqlSessionTemplate sqlSession, FreeBoard hb) {
		return sqlSession.insert("freeboardMapper.insertFile", hb);
	}
	
	public int addReadCount(SqlSessionTemplate sqlSession, int hbId) {
		return sqlSession.update("freeboardMapper.addReadCount", hbId);
	}

	public FreeBoard selectBoard(SqlSessionTemplate sqlSession, int hbId) {
		return sqlSession.selectOne("freeboardMapper.selectBoard", hbId);
	}


	public int updateBoard(SqlSessionTemplate sqlSession, FreeBoard hb) {
		return sqlSession.update("freeboardMapper.updateBoard", hb);
	}

	public int updateFile(SqlSessionTemplate sqlSession, FreeBoard hb) {
		return sqlSession.update("freeboardMapper.updateFile", hb);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int hbId) {
		return sqlSession.update("freeboardMapper.deleteBoard", hbId);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int hbId) {
		return (ArrayList)sqlSession.selectList("freeboardMapper.selectReplyList", hbId);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("freeboardMapper.insertReply", r);
	}


	public int getSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> searchMap) {
		return sqlSession.selectOne("freeboardMapper.getSearchListCount", searchMap);
	}

	public ArrayList<FreeBoard> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> searchMap,  PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("freeboardMapper.selectSearchList", searchMap, rowBounds);
	}

}
