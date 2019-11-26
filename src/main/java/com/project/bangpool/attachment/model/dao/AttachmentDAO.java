package com.project.bangpool.attachment.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.attachment.model.vo.Attachment;

@Repository("attDAO")
public class AttachmentDAO {
	
	public ArrayList<Attachment> selectTopList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attachmentMapper.selectTopList");
	}
	
	public ArrayList<Attachment> selectTopList2(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attachmentMapper.selectTopList2");
	}
	
}
