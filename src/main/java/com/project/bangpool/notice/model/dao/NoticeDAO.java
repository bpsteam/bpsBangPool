package com.project.bangpool.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.common.SearchCondition;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.notice.model.vo.Notice;
import com.project.bangpool.roommateboard.model.vo.RMBoard;

@Repository
public class NoticeDAO {

	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice",n);
	}

	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession,PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset , pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}

	public Notice detailNotice(SqlSessionTemplate sqlSession, int nId) {
		return sqlSession.selectOne("noticeMapper.detailNotice",nId);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int nId) {
		return sqlSession.update("noticeMapper.deleteNotice",nId);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.getListcount");
	}

	public int addReadCount(SqlSessionTemplate sqlSession, int nId) {
		return sqlSession.update("noticeMapper.addReadCount",nId);
	}

	public ArrayList<Notice> selectSearchNotice(SqlSessionTemplate sqlSession, SearchCondition sc,PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset , pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectSearchNotice",sc,rowBounds);
	}

	public int getSearchListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		return sqlSession.selectOne("noticeMapper.getSearchListCount",sc);
	}

	public Notice selectNotice(SqlSessionTemplate sqlSession, int nId) {
		return sqlSession.selectOne("noticeMapper.selectNotice",nId);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.updateNotice",n);
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertAttachment",n);
	}

	public int deleteFileAttachment(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.delete("noticeMapper.deleteAttachment",n);
	}

	public int updateAttachment(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.updateAttachment",n);
	}

	public ArrayList<Notice> selectTopList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectTopList");
	}


}
