package com.project.bangpool.roommateboard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("bupView.rm")
	public ModelAndView boardUpdateView(@RequestParam("rbId") int rbId,
//								@RequestParam("page") int page,
								ModelAndView mv) {
		
		RMBoard rboard = rbService.selectBoard(rbId);
		
		mv.addObject("rboard", rboard)
//		  .addObject("page", page)
		  .setViewName("rmupdateBoard");
		
		return mv;
	}
	
	
	@RequestMapping("bdetail.rm")
	public ModelAndView selectOneBoard(@RequestParam("rbId") int rbId,
									// @RequestParam("page") int page,
									  ModelAndView mv) {
		
		RMBoard board = rbService.selectBoard(rbId);
		
		if(board != null) {
			mv.addObject("rboard", board)
			  .setViewName("rmboardDetailView");
		}else {
			throw new RMBoardException("게시글 상세보기 실패");
		}
		
		return mv;
	}
	
	@RequestMapping("bupdate.rm")
	public ModelAndView boardUpdate(@ModelAttribute RMBoard b,
									HttpServletRequest request,
									ModelAndView mv) {
		
//		if(reloadFile != null && !reloadFile.isEmpty()) {
//			// 기존 필요없는 파일 지우기
//			deleteFile(b.getRenameFileName(), request);
//		}
//		
//		String renameFileName = saveFile(reloadFile, request);
//		
//		if(renameFileName != null) {
//			b.setOriginalFileName(reloadFile.getOriginalFilename());;
//			b.setRenameFileName(renameFileName);
//		}
		
		int result = rbService.updateBoard(b);
		
		if(result > 0) {
			// page가지고 --> bdetail [수정된 거 보여주기]
//			mv.addObject("page", page).setViewName("redirect:bdetail.rm?rbId="+b.getRbId());
			mv.setViewName("redirect:bdetail.rm?rbId="+b.getRbId());
		}else {
			throw new RMBoardException("게시글 수정에 실패");
		}
		
		return mv;
	}
	
	
}


