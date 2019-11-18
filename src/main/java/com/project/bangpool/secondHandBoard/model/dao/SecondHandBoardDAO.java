package com.project.bangpool.secondHandBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.common.Reply;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.roommateboard.model.vo.RMBoard;
import com.project.bangpool.secondHandBoard.model.vo.SecondHandBoard;

@Repository("shbDAO")
public class SecondHandBoardDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("secondHandBoardMapper.getListCount");
	}

	public ArrayList<SecondHandBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("secondHandBoardMapper.selectList", null, rowBounds);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, SecondHandBoard shb) {
		return sqlSession.insert("secondHandBoardMapper.insertBoard", shb);
	}

	public SecondHandBoard selectBoard(SqlSessionTemplate sqlSession, int shbId) {
		return (SecondHandBoard)sqlSession.selectOne("secondHandBoardMapper.selectBoard", shbId);
	}
	
	public int addReadCount(SqlSessionTemplate sqlSession, int shbId) {
		return sqlSession.update("secondHandBoardMapper.addReadCount", shbId);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, SecondHandBoard shb) {
		return sqlSession.update("secondHandBoardMapper.updateBoard",shb);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int shbId) {
		return sqlSession.update("secondHandBoardMapper.deleteBoard", shbId);
	}

	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int shbId) {
		return (ArrayList)sqlSession.selectList("secondHandBoardMapper.replyList", shbId);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply reply) {
		return sqlSession.insert("secondHandBoardMapper.insertReply", reply);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int rId) {
		return sqlSession.update("secondHandBoardMapper.deleteReply",rId);
	}

	
	// 여기부터 카테고리
	
	public ArrayList<SecondHandBoard> sofaList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("secondHandBoardMapper.sofaList", null, rowBounds);
	}
	
	public ArrayList<SecondHandBoard> makeupList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("secondHandBoardMapper.makeupList", null, rowBounds);
	}

	public ArrayList<SecondHandBoard> deskList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("secondHandBoardMapper.deskList", null, rowBounds);
	}

	public ArrayList<SecondHandBoard> tableList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("secondHandBoardMapper.tableList", null, rowBounds);
	}
	
	public ArrayList<SecondHandBoard> displayList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("secondHandBoardMapper.displayList", null, rowBounds);
	}
	
	public ArrayList<SecondHandBoard> selectTopList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("secondHandBoardMapper.selectTopList");
	}
	
}
