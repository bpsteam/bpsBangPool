package com.project.bangpool.freeboard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	
	/*public int addReadCount(SqlSessionTemplate sqlSession, int hbId) {
		return sqlSession.update("freeboardMapper.addReadCount", hbId);
	}*/

	/*public HMBoard selectBoard(SqlSessionTemplate sqlSession, int hbId) {
		return sqlSession.selectOne("hmboardMapper.selectBoard", hbId);
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
	}*/


	/*public int getSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> searchMap) {
		return sqlSession.selectOne("hmboardMapper.getSearchListCount", searchMap);
	}

	public ArrayList<HMBoard> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> searchMap,  PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("hmboardMapper.selectSearchList", searchMap, rowBounds);
	}*/

}
