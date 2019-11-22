package com.project.bangpool.share.model.service;

import java.util.ArrayList;

import com.project.bangpool.common.Reply;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.share.model.vo.Share;

public interface ShareService {

	int getListCount(String sLoc);

	ArrayList<Share> selectList(PageInfo pi, String sLoc);

	int shareInsert(Share s);

	Share shareDetail(int srbId);

	int insertReply(Reply r);

	ArrayList<Reply> selectReplyList(int refBid);

	ArrayList<Share> mapList();

}
