package com.project.bangpool.member.model.service;

import org.springframework.stereotype.Service;

import com.project.bangpool.member.model.vo.Member;

public interface MemberService {

	Member memberLogin(Member m);

	int insertMember(Member m);

	int deleteMember(Member m);

	int checkIdDup(String email);

	int checkNickDup(String nickname);

	Member snsLogin(Member m);
	
}
