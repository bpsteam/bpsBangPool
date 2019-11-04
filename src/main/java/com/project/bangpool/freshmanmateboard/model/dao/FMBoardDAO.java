package com.project.bangpool.freshmanmateboard.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.freshmanmateboard.model.vo.FMBoard;

@Repository("bDAO")
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


}
