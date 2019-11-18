package com.project.bangpool.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bangpool.member.model.vo.Member;

@Repository
public class MemberDAO {

	public Member memberLogin(SqlSessionTemplate sqlSession, Member m) {
		return (Member)sqlSession.selectOne("memberMapper.selectOne", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.deleteMember", m);
	}


	public int addLoginCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.addLoginCount", m);

	public int checkIdDup(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.checkIdDup", email);
	}

	public int checkNickDup(SqlSessionTemplate sqlSession, String nickname) {
		return sqlSession.selectOne("memberMapper.checkNickDup", nickname);
	}

	public Member snsLogin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.snsLogin", m);

	}

}
