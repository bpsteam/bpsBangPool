package com.project.bangpool.freshmanmateboard.model.service;

import java.util.ArrayList;

import com.project.bangpool.comment.model.vo.Reply;
import com.project.bangpool.freshmanmateboard.model.vo.FMBoard;

public interface FMBoardService {
	
	int insertBoard(FMBoard b);

	ArrayList<FMBoard> selectList();

	FMBoard selectBoard(int bId);

	int deleteBoard(int fbId);

	int updateBoard(FMBoard b);

	int insertReply(Reply r);

}
