package com.project.bangpool.housemateboard.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.housemateboard.model.vo.HMBoard;

@Repository("bDAO")
public class HMBoardDAO {

	public ArrayList<HMBoard> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("hmboardMapper.selectList");
	}

}
