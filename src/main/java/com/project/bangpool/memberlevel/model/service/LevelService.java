package com.project.bangpool.memberlevel.model.service;

import java.util.HashMap;

import com.project.bangpool.member.model.vo.Member;
import com.project.bangpool.memberlevel.model.vo.ManageMember;

public interface LevelService {

	ManageMember updateLevel(String mlCode);

	int getLoginCount(String mNo);

	int updatelCode(HashMap<String, String> countMap);

	int getWriteCount(String nickname);

}
