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
		
//		return mDAO.memberLogin(sqlSession, m);
		
		m = mDAO.memberLogin(sqlSession, m);
		
		int result = 0;
		System.out.println("login success: "+m);
		if(m != null) {
			result = mDAO.addLoginCount(sqlSession, m);
			System.out.println("result?"+result);
		}
		
		if(result > 0) {
			System.out.println("login 보내줘: "+m);
			return m;
		}
		return m;
	}

	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}

	@Override
	public int deleteMember(Member m) {
		return mDAO.deleteMember(sqlSession, m);
	}

	@Override
	public int checkIdDup(String email) {
		return mDAO.checkIdDup(sqlSession, email);
	}

	@Override
	public int checkNickDup(String nickname) {
		return mDAO.checkNickDup(sqlSession, nickname);
	}

	@Override
	public Member snsLogin(Member m) {
		return mDAO.snsLogin(sqlSession, m);
	}

	@Override
	public int memberUpdate(Member m) {
		return mDAO.memberUpdate(sqlSession, m);
	}


}
