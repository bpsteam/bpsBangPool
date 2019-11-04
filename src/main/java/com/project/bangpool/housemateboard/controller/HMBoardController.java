package com.project.bangpool.housemateboard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.bangpool.housemateboard.model.exception.HMBoardException;
import com.project.bangpool.housemateboard.model.service.HMBoardService;
import com.project.bangpool.housemateboard.model.vo.HMBoard;

@Controller
public class HMBoardController {
	
	@Autowired	//service에 자동으로 객체 만들어주기
	private HMBoardService hbService;

	/*** 전체 게시글 불러오기 ***/
	@RequestMapping("blist.hm")
	public ModelAndView boardList(ModelAndView mv) {
		
		ArrayList<HMBoard> list = hbService.selectList();
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("hmboardList");
		} else {
			throw new HMBoardException("게시글 전체 조회 실패하였습니다.");
		}
		//return "hmboardList";
		return mv;
	}
	
	
	/*** 게시글 선택시 디테일 화면가기 ***/
	@RequestMapping("bdetail.hm")
	public ModelAndView boardDetail(@RequestParam("hbId") int hbId, 
									ModelAndView mv) {
		
		HMBoard hmboard = hbService.selectBoard(hbId);
		
		if(hmboard != null) {
			mv.addObject("hboard", hmboard)
			  .setViewName("hmboardDetailView");
		} else {
			throw new HMBoardException("게시글 상세보기 조회 실패하였습니다.");
		}
		
		//return "hmboardDetailView";
		return mv;
	}
	
	
	/*** 게시판 글쓰기 클릭시 넘어갈 화면 ***/
	@RequestMapping("binsertView.hm")
	public String insertBoardView() {
		return "hminsertBoard";
	}
	
	/*** 글쓰기 입력후 등록하기 버튼 누를시. ***/
	@RequestMapping("binsert.hm")
	public String boardInsert(HMBoard hb ) {
		
		System.out.println("갔다오기전 hb : "+ hb);
		
		int result = hbService.insertBoard(hb);
		System.out.println("갔다왔니 hb : " + hb);

		if (result > 0) {
			return "redirect:blist.hm";
		} else {
			throw new HMBoardException("게시글 등록 실패하였습니다.");
		}
		 
		
	}
	
	
	
	
}


