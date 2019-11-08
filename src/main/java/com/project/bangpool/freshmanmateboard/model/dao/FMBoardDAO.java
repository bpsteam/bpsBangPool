package com.project.bangpool.freshmanmateboard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.comment.model.vo.Reply;
import com.project.bangpool.freshmanmateboard.model.vo.FMBoard;
import com.project.bangpool.freshmanmateboard.model.vo.PageInfo;
import com.project.bangpool.freshmanmateboard.model.vo.PiBoard;

@Repository("fbDAO")
public class FMBoardDAO {
	
	public int insertBoard(SqlSessionTemplate sqlSession, FMBoard b) {
		return sqlSession.insert("fmboardMapper.insertBoard",b);
	}

//	public ArrayList<PiBoard> selectPiList(SqlSessionTemplate sqlSession, String location, PageInfo pi) {
//		
//		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
//		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
//		System.out.println(offset + " rowBounds: " + rowBounds);
//		return (ArrayList)sqlSession.selectList("fmboardMapper.selectPiList", location, rowBounds);
//	}
	public ArrayList<FMBoard> selectList(SqlSessionTemplate sqlSession, String location, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		System.out.println(offset + " rowBounds: " + rowBounds);
		return (ArrayList)sqlSession.selectList("fmboardMapper.selectList", location, rowBounds);
	}

	public int addReadCount(SqlSessionTemplate sqlSession, int fbId) {
		return sqlSession.update("fmboardMapper.addReadCount", fbId);
	}

	public FMBoard selectBoard(SqlSessionTemplate sqlSession, int fbId) {
		return sqlSession.selectOne("fmboardMapper.selectBoard", fbId);
	}

	public int selectCurrentBno(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("fmboardMapper.selectCurrentBno");
	}

	public int insertFile(SqlSessionTemplate sqlSession, FMBoard b) {
		return sqlSession.insert("fmboardMapper.insertFile", b);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int fbId) {
		return sqlSession.update("fmboardMapper.deleteBoard", fbId);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, FMBoard b) {
		return sqlSession.update("fmboardMapper.updateBoard", b);
	}

	public int updateFile(SqlSessionTemplate sqlSession, FMBoard b) {
		return sqlSession.update("fmboardMapper.updateFile", b);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("fmboardMapper.insertReply", r);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int fbId) {
		return (ArrayList)sqlSession.selectList("fmboardMapper.selectReplyList",fbId);
	}

	public int getListCount(SqlSessionTemplate sqlSession, String location) {
		return sqlSession.selectOne("fmboardMapper.getListCount", location);
	}


}
