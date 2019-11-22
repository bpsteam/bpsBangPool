package com.project.bangpool.housemateboard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.common.Reply;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.housemateboard.model.vo.HMBoard;
import com.project.bangpool.roommateboard.model.vo.RMBoard;

@Repository("hbDAO")
public class HMBoardDAO {

	public ArrayList<HMBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String hLoc) {
		
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("hmboardMapper.selectList", hLoc, rowBounds);
	}

	public int addReadCount(SqlSessionTemplate sqlSession, int hbId) {
		return sqlSession.update("hmboardMapper.addReadCount", hbId);
	}

	public HMBoard selectBoard(SqlSessionTemplate sqlSession, int hbId) {
		return sqlSession.selectOne("hmboardMapper.selectBoard", hbId);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, HMBoard hb) {
		return sqlSession.insert("hmboardMapper.insertBoard", hb);
	}

	public int selectHbId(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("hmboardMapper.selectHbId");
	}

	public int insertFile(SqlSessionTemplate sqlSession, HMBoard hb) {
		return sqlSession.insert("hmboardMapper.insertFile", hb);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, HMBoard hb) {
		return sqlSession.update("hmboardMapper.updateBoard", hb);
	}

	public int updateFile(SqlSessionTemplate sqlSession, HMBoard hb) {
		return sqlSession.update("hmboardMapper.updateFile", hb);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int hbId) {
		return sqlSession.update("hmboardMapper.deleteBoard", hbId);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int hbId) {
		return (ArrayList)sqlSession.selectList("hmboardMapper.selectReplyList", hbId);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("hmboardMapper.insertReply", r);
	}

	public int getListCount(SqlSessionTemplate sqlSession, String hLoc) {
		return sqlSession.selectOne("hmboardMapper.getListCount", hLoc);
	}

	public int getSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> searchMap) {
		return sqlSession.selectOne("hmboardMapper.getSearchListCount", searchMap);
	}

	public ArrayList<HMBoard> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> searchMap,  PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("hmboardMapper.selectSearchList", searchMap, rowBounds);
	}
	
	public ArrayList<HMBoard> selectTopList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("hmboardMapper.selectTopList");
	}
	
}
