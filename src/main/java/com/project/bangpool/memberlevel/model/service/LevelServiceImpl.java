package com.project.bangpool.memberlevel.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.memberlevel.model.dao.LevelDAO;
import com.project.bangpool.memberlevel.model.vo.ManageMember;

@Service("lvService")
public class LevelServiceImpl implements LevelService{
	
	@Autowired
	private LevelDAO lvDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ManageMember updateLevel(String mlCode) {
		return null;
	}

}
