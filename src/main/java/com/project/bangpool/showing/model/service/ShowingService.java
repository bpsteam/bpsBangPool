package com.project.bangpool.showing.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.common.Reply;
import com.project.bangpool.showing.model.dao.ShowingDao;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.showing.model.vo.Showing;

@Service("sService")
public class ShowingService implements ShowingServiceImpl{
	
	@Autowired
	private ShowingDao sbDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertShowingBoard(Showing sb) {
		return sbDao.insertShowingBoard(sqlSession, sb);
	}
	
	@Override
	public int getListCount() {
		return sbDao.getListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Showing> selectList(PageInfo pi) {
		return sbDao.selectList(sqlSession, pi);
	}

	@Override
	public Showing selectShowing(int sbId) {
		Showing sb = null;
		// 조회수 관련
		int result = sbDao.addReadCount(sqlSession, sbId);
		
		if(result>0) {
			sb = sbDao.selectShowing(sqlSession, sbId);
		}
		return sb;
	}
	
	@Override
	public int deleteShowing(int sbId) {
		return sbDao.deleteShowing(sqlSession, sbId);
	}
	
	@Override
	public int updateShowing(Showing sb) {
		int resultShowing = 0; 
		int updateSB = sbDao.updateBoard(sqlSession, sb);
		int updateAT = sbDao.attachmentBoard(sqlSession, sb);
		if(updateSB>0 && updateAT>0) {
			resultShowing = 1;
		}
		return resultShowing;
	}
	
	@Override
	public int insertReply(Reply r) {
		return sbDao.insertReply(sqlSession, r);
	}
	
	@Override
	public ArrayList<Reply> selectReplyList(int sbId) {
		return sbDao.selectReplyList(sqlSession, sbId);
	}
	
	@Override
	public ArrayList<Showing> selectTopList() {
		return sbDao.selectTopList(sqlSession);
	}
	
}
