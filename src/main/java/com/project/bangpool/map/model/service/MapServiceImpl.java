package com.project.bangpool.map.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.map.model.dao.MapViewDAO;
import com.project.bangpool.share.model.vo.Share;

@Service("mapService")
public class MapServiceImpl implements MapService{
	
	@Autowired
	private MapViewDAO mapDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Share> selectList() {
		return mapDao.selectList(sqlSession);
	}
	
}
