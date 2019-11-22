package com.project.bangpool.share.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.common.Reply;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.member.model.vo.Member;
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
	public int insertReplt_event(HashMap<String, String> map) {
		return srDAO.insertReply_event(sqlSession,map);
	}

	@Override
	public ArrayList<Member> selectEventMember(int srbId) {
		return srDAO.selectEventMember(sqlSession,srbId);
	}

	@Override
	public int insertWinner(Share s) {
		return srDAO.insertWinner(sqlSession,s);
	}

	@Override
	public ArrayList<Member> selectMember(HashMap<String, String> map) {
		return srDAO.selectMember(sqlSession,map);
	}

	@Override
	public ArrayList<Share> mapList(){
		return srDAO.mapList(sqlSession);
	}

}
