package com.project.bangpool.housemateboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bangpool.housemateboard.model.service.HMBoardService;

@Controller
public class HMBoardController {
	
	//@Autowired	//service에 자동으로 객체 만들어주기
	//private HMBoardService hbService;

	
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


