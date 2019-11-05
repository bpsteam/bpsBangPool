package com.project.bangpool.roommateboard.model.service;

import java.util.ArrayList;

import com.project.bangpool.roommateboard.model.vo.RMBoard;

public interface RMBoardService {
	
	int insertBoard(RMBoard b);
	
	ArrayList<RMBoard> selectList();
	
	RMBoard selectBoard(int rbId);

}
