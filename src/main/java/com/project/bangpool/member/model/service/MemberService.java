package com.project.bangpool.member.model.service;



import com.project.bangpool.member.model.vo.Member;
//import com.project.bangpool.member.model.vo.Profile;

public interface MemberService {

	Member memberLogin(Member m);

	int insertMember(Member m);

	int deleteMember(Member m);

	int checkIdDup(String email);

	int checkNickDup(String nickname);

	Member snsLogin(Member m);

	int memberUpdate(Member m);

	int insertProfile(Member m);


}
