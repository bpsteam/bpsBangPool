package com.project.bangpool.map.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.share.model.vo.Share;
@Repository("mapDao")
public class MapViewDAO {
	
		// share 게시글 
		public ArrayList<Share> selectList(SqlSessionTemplate sqlSession) {
			return (ArrayList)sqlSession.selectList("mapMapper.listMap");
		}
	
}
