package com.project.bangpool.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bangpool.member.model.dao.MemberDAO;
import com.project.bangpool.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	// root-context 에 있는 sqlSession을 말하는거다. 
	
	public Member memberLogin(Member m) {

		return mDAO.memberLogin(sqlSession, m);
	}


}
