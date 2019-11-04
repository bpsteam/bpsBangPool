package com.project.bangpool.housemateboard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.bangpool.housemateboard.model.service.HMBoardService;
import com.project.bangpool.housemateboard.model.vo.HMBoard;
import com.project.bangpool.housemateboard.model.exception.HMBoardException;

@Controller
public class HMBoardController {
	
	@Autowired	//service에 자동으로 객체 만들어주기
	private HMBoardService hbService;

	
	@RequestMapping("blist.hm")
	public ModelAndView boardList(ModelAndView mv) {
		
		ArrayList<HMBoard> list = hbService.selectList();
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("hmboardList");
		} else {
			throw new HMBoardException("게시글 전체 조회 실패");
		}
		//return "hmboardList";
		return mv;
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


