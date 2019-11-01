package com.project.bangpool.housemateboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HMBoardController {

	@RequestMapping("blist.hm")
	public String boardList() {
		return "hmboardList";
	}
	
	
	@RequestMapping("binsert.hm")
	public String insertBoard() {
		return "hminsertBoard";
	}
	
	@RequestMapping("bdetail.hm")
	public String selectOneBoard() {
		
		return "hmboardDetailView";
	}
	
}


