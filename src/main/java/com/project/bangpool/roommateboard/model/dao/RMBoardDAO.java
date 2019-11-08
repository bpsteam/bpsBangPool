package com.project.bangpool.roommateboard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.comment.model.vo.Reply;
import com.project.bangpool.freshmanmateboard.model.vo.PageInfo;
import com.project.bangpool.roommateboard.model.vo.RMBoard;

@Repository("rbDAO")
public class RMBoardDAO {
	
	
	public int insertBoard(SqlSessionTemplate sqlSession, RMBoard b) {
		return sqlSession.insert("rmboardMapper.insertBoard", b);
	}

	public ArrayList<RMBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("rmboardMapper.selectList", null, rowBounds);
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

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("rmboardMapper.getListCount");
	}
	

}
