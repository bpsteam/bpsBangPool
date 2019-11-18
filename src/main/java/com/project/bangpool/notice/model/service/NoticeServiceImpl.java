package com.project.bangpool.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.common.SearchCondition;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.notice.model.dao.NoticeDAO;
import com.project.bangpool.notice.model.vo.Notice;
import com.project.bangpool.roommateboard.model.vo.RMBoard;

@Service("nService")
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO nDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insert_Notice(Notice n) {
		return nDAO.insertNotice(sqlSession,n);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return nDAO.selectList(sqlSession,pi);
	}

	@Override
	public Notice detail_Notice(int nId) {
		
		Notice n = null;
		
		int result = nDAO.addReadCount(sqlSession,nId);
		if(result > 0) {
			return nDAO.detailNotice(sqlSession,nId);
		}
		return n;
	}

	@Override
	public int delete_Notice(int nId) {
		return nDAO.deleteNotice(sqlSession,nId);
	}

	@Override
	public int getListCount() {
		return nDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectSearchNotice(SearchCondition sc,PageInfo pi) {
		return nDAO.selectSearchNotice(sqlSession,sc,pi);
	}

	@Override
	public int getSearchListCount(SearchCondition sc) {
		return nDAO.getSearchListCount(sqlSession,sc);
	}

	@Override
	public int updateNotice(Notice n, Notice notice) {
		
		int result = 0;
		
		result =  nDAO.updateNotice(sqlSession,n);
		
		if(notice.getOriginalFileName() != null) {

			result = nDAO.deleteFileAttachment(sqlSession,n);

		}
		return result;
		
	}

	@Override
	public int updateFileNotice(Notice n, Notice notice) {
		
		int result = 0;
		
		result =  nDAO.updateNotice(sqlSession,n);
		
		if(notice.getOriginalFileName() == null) {
			
			result = nDAO.insertAttachment(sqlSession,n);
			
		}else {
			
			result = nDAO.updateAttachment(sqlSession,n);
			
		}
		
		return result;
	}

	
	@Override
	public ArrayList<Notice> selectTopList() {
		return nDAO.selectTopList(sqlSession);
	}





}
