package com.project.bangpool.roommateboard.model.service;

import java.util.ArrayList;

import com.project.bangpool.common.Reply;
import com.project.bangpool.common.SearchCondition;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.roommateboard.model.vo.RMBoard;

public interface RMBoardService {
	
	int insertBoard(RMBoard b);
	
	ArrayList<RMBoard> selectList(PageInfo pi, String loc);
	
	RMBoard selectBoard(int rbId);
	
	int updateBoard(RMBoard b);

	ArrayList<Reply> selectReplyList(int rbId);

	int insertReply(Reply r);
	
	int deleteBoard(int rbId);

	int getListCount(String loc);

	int getSearchResultListCount(SearchCondition sc);

	ArrayList<RMBoard> selectSearchResultList(SearchCondition sc, PageInfo pi);

	ArrayList<RMBoard> selectTopList();

}
