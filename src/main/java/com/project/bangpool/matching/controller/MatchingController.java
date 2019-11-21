package com.project.bangpool.matching.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.project.bangpool.freshmanmateboard.model.vo.FMBoard;
import com.project.bangpool.housemateboard.model.vo.HMBoard;
import com.project.bangpool.matching.model.service.MatchingService;
import com.project.bangpool.roommateboard.model.vo.RMBoard;



@Controller
public class MatchingController {
	
	@Autowired
	private MatchingService mcService;

	@RequestMapping("matchingList.mc")
	public void matchingList(HttpServletResponse response, 
							String mBcode, String mLocation, String mReqgender, 
							String mLivingType, String mRoom) throws JsonIOException, IOException {
		
		response.setContentType("application/json; charset=utf-8");
		HashMap<String, String> matchingMap = new HashMap<String, String>();
		matchingMap.put("mBc", mBcode);
		matchingMap.put("mLoc", mLocation);
		matchingMap.put("mReq", mReqgender);
		matchingMap.put("mLiv", mLivingType);
		matchingMap.put("mRom", mRoom);
		
		System.out.println(matchingMap);
		
		Gson gson = new GsonBuilder().create();
		System.out.println("gson 생성! ");
		System.out.println("mBCode: "+ mBcode);
		
		if( mBcode.equals("RMBCODE")) {
			ArrayList<RMBoard> mlist = mcService.selectRMatching(matchingMap);
			System.out.println("RM list :" +mlist);
			gson.toJson(mlist, response.getWriter());
		} else if( mBcode.equals("HMBCODE")) {
			ArrayList<HMBoard> mlist = mcService.selectHMatching(matchingMap);
			System.out.println("HM list :" +mlist);
			gson.toJson(mlist, response.getWriter());
		} else if( mBcode.equals("FMBCODE")) {
			ArrayList<FMBoard> mlist = mcService.selectFMatching(matchingMap);
			gson.toJson(mlist, response.getWriter());
		} 
		
		
	}
	

	
}
