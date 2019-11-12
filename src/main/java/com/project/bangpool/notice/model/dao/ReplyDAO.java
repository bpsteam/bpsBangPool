package com.project.bangpool.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.common.Reply;

@Repository
public class ReplyDAO {

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("noticeMapper.insertReply",r);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int refBid) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectReplyList",refBid);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int rId) {
		return sqlSession.update("noticeMapper.deleteReply",rId);
	}

}
