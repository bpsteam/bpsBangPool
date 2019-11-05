package com.project.bangpool.roommateboard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.bangpool.roommateboard.model.exception.RMBoardException;
import com.project.bangpool.roommateboard.model.service.RMBoardService;
import com.project.bangpool.roommateboard.model.vo.RMBoard;

@Controller
public class RMBoardController {
	
	@Autowired
	private RMBoardService rbService;

	@RequestMapping("blist.rm")
	public ModelAndView boardList(ModelAndView mv) {
		
		ArrayList<RMBoard> list = rbService.selectList();
		
		if(list != null) {
			System.out.println("rbService list : "+list);
			mv.addObject("list", list);
			mv.setViewName("rmboardList");
		}else {
			throw new RMBoardException("게시글 전체 조회 실패");
		}
		return mv;
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
			throw new RMBoardException("게시글 등록 실패");
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


