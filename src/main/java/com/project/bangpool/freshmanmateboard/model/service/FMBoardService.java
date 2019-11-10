package com.project.bangpool.freshmanmateboard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.bangpool.comment.model.vo.Reply;
import com.project.bangpool.freshmanmateboard.model.vo.FMBoard;
import com.project.bangpool.freshmanmateboard.model.vo.PageInfo;
import com.project.bangpool.freshmanmateboard.model.vo.PiBoard;

public interface FMBoardService {
	
	int insertBoard(FMBoard b);

//	ArrayList<PiBoard> selectPiList(String location, PageInfo pi);
	
	ArrayList<FMBoard> selectList(String location, PageInfo pi);

	FMBoard selectBoard(int fbId);

	int deleteBoard(int fbId);

	int updateBoard(FMBoard b);

	int insertReply(Reply r);

	ArrayList<Reply> selectReplyList(int fbId);

	int getListCount(String location);

	int getSearchListCount(HashMap<String, String> searchMap);

	ArrayList<FMBoard> searchList(HashMap<String, String> searchMap, PageInfo pi);

	int deleteReply(int rId);

}
