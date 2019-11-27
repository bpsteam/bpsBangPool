package com.project.bangpool.showing.model.service;

import java.util.ArrayList;

import com.project.bangpool.common.Reply;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.roommateboard.model.vo.RMBoard;
import com.project.bangpool.showing.model.vo.Showing;

public interface ShowingServiceImpl {
	
	int insertShowingBoard(Showing sb);
	
	int getListCount();
	
	ArrayList<Showing> selectList(PageInfo pi);
	
	Showing selectShowing (int sbId);
	
	int deleteShowing(int sbId);

	int updateShowing(Showing sb);

	int insertReply(Reply r);

	ArrayList<Reply> selectReplyList(int sbId);
	
	ArrayList<Showing> selectTopList();
	
	int deleteReply(int rId);
}
