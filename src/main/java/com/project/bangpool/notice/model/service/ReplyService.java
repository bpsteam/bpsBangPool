package com.project.bangpool.notice.model.service;

import java.util.ArrayList;

import com.project.bangpool.common.Reply;

public interface ReplyService {

	int insertReply(Reply r);

	ArrayList<Reply> selectReplyList(int refBid);

	int deleteReply(int rId);

}
