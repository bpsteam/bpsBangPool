package com.project.bangpool.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.common.Reply;
import com.project.bangpool.notice.model.dao.ReplyDAO;

@Service("rService")
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyDAO rDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertReply(Reply r) {
		return rDAO.insertReply(sqlSession,r);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int refBid) {
		return rDAO.selectReplyList(sqlSession,refBid);
	}

	@Override
	public int deleteReply(int rId) {
		return rDAO.deleteReply(sqlSession,rId);
	}
	
	


}
