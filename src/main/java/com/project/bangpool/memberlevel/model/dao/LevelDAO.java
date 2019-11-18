package com.project.bangpool.memberlevel.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.memberlevel.model.vo.ManageMember;

@Repository
public class LevelDAO {

	public int getLoginCount(SqlSessionTemplate sqlSession, String mNo) {
		return sqlSession.selectOne("levelMapper.getLoginCount", mNo);
	}

	/*public ManageMember updateLevel(SqlSessionTemplate sqlSession, String mlCode) {
		return sqlSession.update("levelMapper.updateLevel", mlCode);
	}*/

}
