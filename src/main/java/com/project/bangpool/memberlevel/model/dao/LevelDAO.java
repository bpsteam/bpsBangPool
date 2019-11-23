package com.project.bangpool.memberlevel.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.member.model.vo.Member;
import com.project.bangpool.memberlevel.model.vo.ManageMember;

@Repository
public class LevelDAO {

	public int getLoginCount(SqlSessionTemplate sqlSession, String mNo) {
		return sqlSession.selectOne("levelMapper.getLoginCount", mNo);
	}

//	public String selectlCode(SqlSessionTemplate sqlSession, int loginCount) {
//		return sqlSession.selectOne("levelMapper.selectlCode", loginCount);
//	}

	public int updatelCode(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("levelMapper.updatelCode", m);
	}

}
