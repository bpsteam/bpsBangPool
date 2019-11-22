package com.project.bangpool.share.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.common.Reply;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.share.model.dao.ShareDAO;
import com.project.bangpool.share.model.vo.Share;

@Service("srService")
public class ShareServiceImpl implements ShareService{
	
	@Autowired
	private ShareDAO srDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount(String sLoc) {
		return srDAO.getListCount(sqlSession,sLoc);
	}

	@Override
	public ArrayList<Share> selectList(PageInfo pi, String sLoc) {
		return srDAO.selectList(sqlSession,pi,sLoc);
	}

	@Override
	public int shareInsert(Share s) {
		return srDAO.shareInsert(sqlSession,s);
	}

	@Override
	public Share shareDetail(int srbId) {
		return srDAO.shareDetail(sqlSession,srbId);
	}

	@Override
	public int insertReply(Reply r) {
		return srDAO.insertReply(sqlSession,r);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int refBid) {
		return srDAO.listReply(sqlSession,refBid);
	}
	
	@Override
	public ArrayList<Share> mapList(){
		return srDAO.mapList(sqlSession);
	}
}
