package com.project.bangpool.roommateboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RMBoardController {

	@RequestMapping("blist.rm")
	public String boardList() {
		return "rmboardList";
	}
	
	
	@RequestMapping("binsert.rm")
	public String insertBoard() {
		return "rminsertBoard";
	}
	
	@RequestMapping("bdetail.rm")
	public String selectOneBoard() {
		
		return "rmboardDetailView";
	}
	
}


