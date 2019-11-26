package com.project.bangpool.attachment.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.attachment.model.dao.AttachmentDAO;
import com.project.bangpool.attachment.model.vo.Attachment;

@Service("attService")
public class AttachmentServiceImpl implements AttachmentService {
	
	@Autowired
	private AttachmentDAO attDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	// root-context 에 있는 sqlSession을 말하는거다. 

	
	@Override
	public ArrayList<Attachment> selectTopList() {
		return attDAO.selectTopList(sqlSession);
	}
	
	@Override
	public ArrayList<Attachment> selectTopList2() {
		return attDAO.selectTopList2(sqlSession);
	}
	
	
	
	
	
	
	
}
