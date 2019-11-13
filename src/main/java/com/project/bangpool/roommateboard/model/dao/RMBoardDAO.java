package com.project.bangpool.roommateboard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.common.Reply;
import com.project.bangpool.common.SearchCondition;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.roommateboard.model.vo.RMBoard;

@Repository("rbDAO")
public class RMBoardDAO {
	
	
	public int insertBoard(SqlSessionTemplate sqlSession, RMBoard b) {
		return sqlSession.insert("rmboardMapper.insertBoard", b);
	}

	public ArrayList<RMBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String loc) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("rmboardMapper.selectList", loc, rowBounds);
	}

	public int addReadCount(SqlSessionTemplate sqlSession, int rbId) {
		return sqlSession.update("rmboardMapper.addReadCount", rbId);
	}

	public RMBoard selectBoard(SqlSessionTemplate sqlSession, int rbId) {
		return sqlSession.selectOne("rmboardMapper.selectBoard", rbId);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, RMBoard b) {
		System.out.println("updatedao");
		return sqlSession.update("rmboardMapper.updateBoard", b);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int rbId) {
		return (ArrayList)sqlSession.selectList("rmboardMapper.selectReplyList", rbId);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("rmboardMapper.insertReply", r);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int rbId) {
		return sqlSession.update("rmboardMapper.deleteBoard", rbId);
	}

	public int getListCount(SqlSessionTemplate sqlSession, String loc) {
		return sqlSession.selectOne("rmboardMapper.getListCount");
	}

	public int updateFile(SqlSessionTemplate sqlSession, RMBoard b) {
		return sqlSession.update("rmboardMapper.updateFile", b);
	}

	public int getSearchResultListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		return sqlSession.selectOne("rmboardMapper.selectSearchResultCount", sc);
	}

	public ArrayList<RMBoard> selectSearchResultList(SqlSessionTemplate sqlSession, SearchCondition sc, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("rmboardMapper.selectSearchResultList", sc, rowBounds);
	}


	public int selectBno(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("rmboardMapper.selectBno");
	}

	public int insertFile(SqlSessionTemplate sqlSession, RMBoard b) {
		return sqlSession.insert("rmboardMapper.insertFile", b);
	}

	public ArrayList<RMBoard> selectTopList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("rmboardMapper.selectTopList");
	}
	

	
	
	

}
