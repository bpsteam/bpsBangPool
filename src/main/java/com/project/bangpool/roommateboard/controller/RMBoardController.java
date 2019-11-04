package com.project.bangpool.roommateboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bangpool.roommateboard.model.exception.BoardException;
import com.project.bangpool.roommateboard.model.service.RMBoardService;
import com.project.bangpool.roommateboard.model.vo.RMBoard;

@Controller
public class RMBoardController {
	
	@Autowired
	private RMBoardService rbService;

	@RequestMapping("blist.rm")
	public String boardList() {
		return "rmboardList";
	}
	
	
	@RequestMapping("binsert.rm")
	public String insertBoard(@ModelAttribute RMBoard b) {
		
		System.out.println("Controller!!!!!" + b);
		
		int result = rbService.insertBoard(b);
		
		if(result > 0) {
//			return "rmBoard";
			System.out.println("성공");
			return "redirect:home.do";
		}else {
			throw new BoardException("게시글 등록 실패");
		}
		
	}
	
	@RequestMapping("binsertview.rm")
	public String insertViewBoard() {
		return "rminsertBoard";
		
	}
	
	
	@RequestMapping("bdetail.rm")
	public String selectOneBoard() {
		
		return "rmboardDetailView";
	}
	
}


