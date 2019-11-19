package com.project.bangpool.matching.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.bangpool.freshmanmateboard.model.vo.FMBoard;
import com.project.bangpool.housemateboard.model.vo.HMBoard;
import com.project.bangpool.roommateboard.model.vo.RMBoard;

public interface MatchingService {
	
	ArrayList<RMBoard> selectRMatching(HashMap<String, String> matchingMap);

	ArrayList<HMBoard> selectHMatching(HashMap<String, String> matchingMap);

	ArrayList<FMBoard> selectFMatching(HashMap<String, String> matchingMap);
}
