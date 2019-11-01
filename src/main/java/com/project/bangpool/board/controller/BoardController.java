package com.project.bangpool.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("blist.bo")
	public String boardList() {
		return "boardList";
	}
	
	
	@RequestMapping("binsert.bo")
	public String insertBoard() {
		return "insertBoard";
	}
	
	@RequestMapping("bdetail.bo")
	public String selectOneBoard() {
		
		return "boardDetailView";
	}
	
}


