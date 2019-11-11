package com.project.bangpool.roommateboard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.comment.model.vo.Reply;
import com.project.bangpool.common.PageInfo;
import com.project.bangpool.common.SearchCondition;
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
	
//	return (ArrayList)sqlSession.selectList("rmboardMapper.selectList", loc, rowBounds);
	
//		ArrayList<Board> list = (ArrayList)session.selectList(
//				"boardMapper.selectSearchResultList",sc, rowBounds);
//		
//		if(list == null) {
//			session.close();
//			throw new BoardException("검색 결과 리스트 조회에 실패하였습니다.");
//		}
//		
//		return list;
	
	
	

}
