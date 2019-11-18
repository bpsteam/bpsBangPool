package com.project.bangpool.secondHandBoard.model.service;

import java.util.ArrayList;

import com.project.bangpool.common.Reply;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.roommateboard.model.vo.RMBoard;
import com.project.bangpool.secondHandBoard.model.vo.SecondHandBoard;

public interface SecondHandBoardService {

	int getListCount();

	ArrayList<SecondHandBoard> SelectList(PageInfo pi);

	int insertBoard(SecondHandBoard shb);

	SecondHandBoard selectBoard(int shbId);

	int updateBoard(SecondHandBoard shb);

	int deleteBoard(int shbId);

	ArrayList<Reply> selectReply(int shbId);

	int insertReply(Reply reply);

	int deleteReply(int rId);

	ArrayList<SecondHandBoard> sofaList(PageInfo pi);

	ArrayList<SecondHandBoard> makeupList(PageInfo pi);
	
	ArrayList<SecondHandBoard> deskList(PageInfo pi);
	
	ArrayList<SecondHandBoard> tableList(PageInfo pi);

	ArrayList<SecondHandBoard> displayList(PageInfo pi);
	
	ArrayList<SecondHandBoard> selectTopList();

}
