package com.project.bangpool.matching.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.bangpool.roommateboard.model.vo.RMBoard;

public interface MatchingService {
	
	ArrayList<RMBoard> selectMatching(HashMap<String, String> matchingMap);
}
