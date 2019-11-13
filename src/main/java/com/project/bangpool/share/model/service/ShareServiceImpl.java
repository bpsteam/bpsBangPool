package com.project.bangpool.share.model.service;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("srService")
public class ShareServiceImpl implements ShareService{
	
	@Autowired
	private ShareServiceImpl srDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
