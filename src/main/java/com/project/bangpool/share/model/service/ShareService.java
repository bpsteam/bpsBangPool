package com.project.bangpool.share.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.bangpool.common.Reply;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.member.model.vo.Member;
import com.project.bangpool.share.model.vo.Map;
import com.project.bangpool.share.model.vo.Share;

public interface ShareService {

	int getListCount(String sLoc);

	ArrayList<Share> selectList(PageInfo pi, String sLoc);

	int shareInsert(Share s);

	Share shareDetail(int srbId);

	int insertReply(Reply r);

	ArrayList<Reply> selectReplyList(int refBid);

	ArrayList<Map> mapList();
	
	int insertReplt_event(HashMap<String, String> map);

	ArrayList<Member> selectEventMember(int srbId);

	int insertWinner(Share s);

	ArrayList<Member> selectMember(Reply r);

	ArrayList<Member> countMember(int srbId);

	int deleteReply(int rId);


}
