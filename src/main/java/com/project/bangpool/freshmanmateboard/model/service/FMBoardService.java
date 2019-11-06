package com.project.bangpool.freshmanmateboard.model.service;

import java.util.ArrayList;

import com.project.bangpool.comment.model.vo.Reply;
import com.project.bangpool.freshmanmateboard.model.vo.FMBoard;
import com.project.bangpool.freshmanmateboard.model.vo.PageInfo;

public interface FMBoardService {
	
	int insertBoard(FMBoard b);

	ArrayList<FMBoard> selectList(String location, PageInfo pi);

	FMBoard selectBoard(int fbId);

	int deleteBoard(int fbId);

	int updateBoard(FMBoard b);

	int insertReply(Reply r);

	ArrayList<Reply> selectReplyList(int fbId);

	int getListCount();

}
