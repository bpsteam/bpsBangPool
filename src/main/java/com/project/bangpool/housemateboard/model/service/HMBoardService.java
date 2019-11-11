package com.project.bangpool.housemateboard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.bangpool.comment.model.vo.Reply;
import com.project.bangpool.common.PageInfo;
import com.project.bangpool.housemateboard.model.vo.HMBoard;

public interface HMBoardService {

	ArrayList<HMBoard> selectList(PageInfo pi, String hLoc);

	HMBoard selectBoard(int hbId);

	int insertBoard(HMBoard hb);

	int updateBoard(HMBoard hb);

	int deleteBoard(int hbId);

	ArrayList<Reply> selectReplyList(int hbId);

	int insertReply(Reply r);

	int getListCount(String hLoc);

	int getSearchListCount(HashMap<String, String> searchMap);

	ArrayList<HMBoard> selectSearchList(HashMap<String, String> searchMap,  PageInfo pi);

}
