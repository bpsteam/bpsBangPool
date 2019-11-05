package com.project.bangpool.housemateboard.model.service;

import java.util.ArrayList;

import com.project.bangpool.housemateboard.model.vo.HMBoard;

public interface HMBoardService {

	ArrayList<HMBoard> selectList();

	HMBoard selectBoard(int hbId);

	int insertBoard(HMBoard hb);

	int updateBoard(HMBoard hb);

}
