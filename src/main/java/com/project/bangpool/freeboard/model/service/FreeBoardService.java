package com.project.bangpool.freeboard.model.service;

import java.util.ArrayList;

import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.freeboard.model.vo.FreeBoard;

public interface FreeBoardService {

	ArrayList<FreeBoard> selectList(PageInfo pi);
	
	int getListCount();

	int insertBoard(FreeBoard hb);

	/*HMBoard selectBoard(int hbId);

	int updateBoard(HMBoard hb);

	int deleteBoard(int hbId);

	ArrayList<Reply> selectReplyList(int hbId);

	int insertReply(Reply r);*/
	
	/*int getSearchListCount(HashMap<String, String> searchMap);

	ArrayList<HMBoard> selectSearchList(HashMap<String, String> searchMap,  PageInfo pi);*/

}
