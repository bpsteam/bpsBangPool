package com.project.bangpool.showing.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.common.Reply;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.roommateboard.model.vo.RMBoard;
import com.project.bangpool.showing.model.vo.Showing;

@Repository("sbDao")
public class ShowingDao {
	
	// 자랑하기 게시글 board insert
	public int insertShowingBoard(SqlSessionTemplate sqlSession, Showing sb) {
		return sqlSession.insert("showingMapper.insertShowing",sb);
	}
	// 자랑하기 게시글 수
	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("showingMapper.getListCount");
	}
	// 자랑하기 게시글 + 페이징
	public ArrayList<Showing> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("showingMapper.selectList", null, rowBounds);
	}
	// 자랑하기 게시글 조회수	
	public int addReadCount(SqlSessionTemplate sqlSession, int sbId) {
		return sqlSession.update("showingMapper.addReadCount", sbId);
	}
	// detail view 를 위한 자랑하기 게시글 하나 선택
	public Showing selectShowing(SqlSessionTemplate sqlSession, int sbId) {
		return (Showing)sqlSession.selectOne("showingMapper.selectShowing", sbId);
	}
	// delete showing board
	public int deleteShowing(SqlSessionTemplate sqlSession, int sbId) {
		return sqlSession.update("showingMapper.deleteShowing", sbId);
	}
	// update showing board
	public int updateBoard(SqlSessionTemplate sqlSession, Showing sb) {
		return sqlSession.update("showingMapper.updateShowing" , sb);
	}
	// update attachment board
	public int attachmentBoard(SqlSessionTemplate sqlSession, Showing sb) {
		return sqlSession.update("showingMapper.updateAttachment", sb);
	}
	// insert showing reply
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("showingMapper.insertReply", r);
	}
	// selectList showing reply
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int sbId) {
		return (ArrayList)sqlSession.selectList("showingMapper.selectReplyList", sbId);
	}
	public ArrayList<Showing> selectTopList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("showingMapper.selectTopList");
	}
	
}
