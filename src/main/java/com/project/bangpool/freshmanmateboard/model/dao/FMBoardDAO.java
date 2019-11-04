package com.project.bangpool.freshmanmateboard.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.comment.model.vo.Reply;
import com.project.bangpool.freshmanmateboard.model.vo.FMBoard;

@Repository("fbDAO")
public class FMBoardDAO {
	
	public int insertBoard(SqlSessionTemplate sqlSession, FMBoard b) {
		return sqlSession.insert("fmboardMapper.insertBoard",b);
	}

	public ArrayList<FMBoard> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fmboardMapper.selectList");
	}

	public int addReadCount(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("fmboardMapper.addReadCount", bId);
	}

	public FMBoard selectBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("fmboardMapper.selectBoard", bId);
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


}
