package com.project.bangpool.freshmanmateboard.model.service;

import java.util.ArrayList;

import com.project.bangpool.freshmanmateboard.model.vo.FMBoard;

public interface FMBoardService {
	
	int insertBoard(FMBoard b);

	ArrayList<FMBoard> selectList();

}
