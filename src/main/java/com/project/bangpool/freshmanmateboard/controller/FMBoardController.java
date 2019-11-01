package com.project.bangpool.freshmanmateboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FMBoardController {

	@RequestMapping("blist.fm")
	public String boardList() {
		return "fmBoardList";
	}
	
	
	@RequestMapping("binsert.fm")
	public String insertBoard() {
		return "fmInsertBoard";
	}
	
	@RequestMapping("bdetail.fm")
	public String selectOneBoard() {
		
		return "fmBoardDetailView";
	}
	
}


